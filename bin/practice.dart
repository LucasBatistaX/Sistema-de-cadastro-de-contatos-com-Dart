import 'dart:io';

void main(List<String> arguments) {
  Map<String, String> contatos = {};
  bool rodando = true;

  // controle de fluxo
  while (rodando) {
    //Tela de opções;
    print('== Agenda de Contatos ==');
    print('1 - Adicionar contato');
    print('2 - Listar contatos ');
    print('3 - Remover contato');
    print('4 - Buscar contato ');
    print('5 - Sair');
    print('\n');
    print('Escolha uma opção');

    String? tc = stdin.readLineSync();
    int? escolha = int.tryParse(tc ?? '');

    switch (escolha) {
      case 1:
        print('Digite o nome: ');
        String? tN = stdin.readLineSync();
        print('Digite o telefone: ');
        String? tL = stdin.readLineSync();
        //adicionar os dados + validação dos dados;
        if (tN == null || tN.isEmpty || tL == null || tL.isEmpty) {
          print('Nome ou telefone inválidos 😟');
        } else {
          contatos[tN] = tL;
          print('Dados salvos com sucesso✅');
          print('\n');
        }

        break;
      //----------------------------------------------------------------------
      case 2:
        if (contatos.isEmpty) {
          print('não há contatos para serem listados😟');
        } else {
          print('\n ==Lista de Contatos==');
          contatos.forEach((nome, telefone) {
            print('$nome: $telefone');
          });
          print('\n');
        }
        break;
      //--------------------------------------------------------------------
      case 3:
        print('Digite o nome do contato a ser excluído');
        String? cX = stdin.readLineSync();
        if (contatos.containsKey(cX)) {
          contatos.remove(cX);
          print('Contato excluido com sucesso!✅');
        } else {
          print('Contato não encontrado 😟');
        }
        break;
      //----------------------------------------------------------------
      case 4:
        print('Digite o nome do contato que está buscando.🔎');
        String? busca = stdin.readLineSync();
        if (contatos.containsKey(busca)) {
          print('Contato localizado com sucesso✅');
          print('$busca: ${contatos[busca]}');
        } else {
          print('Contato não encontrado. 😟');
        }
        break;
      case 5:
        print('Encerrando a agenda por enquanto, Até Mais !👋');
        rodando = false;
        break;

      default:
        print('Selecione uma opção válida⚠️');
    }
  }
}
