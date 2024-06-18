import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @observable
  double totalDaCompra = 0;

  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaCarrinho(Item item) {
    listaItem.add(item);
    atualizarTotalDaCompra();
  }

  @action
  void removerCarrinho(Item item) {
    listaItem.remove(item);
    atualizarTotalDaCompra();
  }

  @action
  void atualizarTotalDaCompra() {
    totalDaCompra = 0;
    for (var i = 0; i < listaItem.length; i++) {
      totalDaCompra += listaItem[i].preco;
    }
  }
}
