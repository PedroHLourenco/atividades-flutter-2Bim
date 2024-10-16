import 'package:flutter/material.dart';
import 'package:mobile/service/transacao.dart';
import 'package:mobile/screen/lista.dart';

class TransacaoForm extends StatefulWidget {
  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();

  void _submitForm() async {
    String id = _idController.text;
    String nome = _nameController.text;
    String valor = _valueController.text;

    if (nome.isNotEmpty && valor.isNotEmpty) {
      var service = TransacaoService();
      await service.createTransacao(id, nome, valor);

      _idController.clear();
      _nameController.clear();
      _valueController.clear();

      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TransacaoPageList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Transação')),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Adicionar Transação'),
            ),
          ],
        ),
      ),
    );
  }
}
