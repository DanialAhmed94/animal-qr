import 'package:flutter/material.dart';
import 'package:pet_project/modal/recievPet_model.dart';
import 'package:pet_project/views/scanner/scanner_detail_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';

import '../addPet/add_pet.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({Key? key}) : super(key: key);

  @override
  _QRScannerViewState createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _scanning = false;
  String? _errorMessage;

  void _rescan() {
    setState(() {
      _scanning = false;
      _errorMessage = null;
    });
    controller?.resumeCamera();
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child:
              _scanning
                  ? CircularProgressIndicator()
                  : _errorMessage != null
                      ? Text('Error: $_errorMessage',
                          style: TextStyle(color: Colors.red))
                      : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final bearerToken = prefs.getString('auth_token');
      if (!_scanning) {
        setState(() {
          _scanning = true;
          _errorMessage = null;
        });

        String url = scanData.code ?? "";
        print('Status code - ${scanData.code}');

        try {
          // Define custom headers
          Map<String, String> headers = {
            'Custom-Header': 'app',
            'Authorization': 'Bearer $bearerToken',
          };
          final response = await http.get(Uri.parse(url), headers: headers);
          print("response- $response");
          if (response.statusCode == 404) {
            final data = json.decode(response.body);
            final _hiddenId = data['unique_id'];
            // Handle the response data as needed
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddPetInitial(
                hiddenId: _hiddenId,
              );
            }));
            controller?.pauseCamera();
            controller?.dispose();
          } else if (response.statusCode == 200) {
            final responseData = jsonDecode(response.body);
            final RPet rPet = RPet.fromJson(responseData['data']);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScannerDetailView(
                          rPet: rPet,
                        )));
            print('rpet object ${rPet.userId}');
            controller?.pauseCamera();
            controller?.dispose();
          } else {
            setState(() {
              _errorMessage =
                  'Failed to load data. Status code: ${response.statusCode}';
            });
          }
        } catch (e) {
          setState(() {
            _errorMessage = 'An error occurred: $e';
          });
        } finally {
          setState(() {
            _scanning = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
