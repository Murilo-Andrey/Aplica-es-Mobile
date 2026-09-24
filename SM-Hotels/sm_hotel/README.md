# S&M Hotel

## Sobre as imagens

As fotos dos destinos vêm da internet (via `Image.network`), então não é preciso
baixar nem organizar nenhum arquivo de imagem — é só rodar o app com internet
disponível no emulador/celular.

Se o seu professor pedir explicitamente imagens locais (como no pubspec.yaml
mostrado no material da aula), duas opções:

1. Baixe fotos dos destinos, salve em `images/` com os nomes angra.jpg,
   jeri.jpg, arraial.jpg, flori.jpg, madri.jpg, paris.jpg, orlando.jpg,
   lasvegas.jpg, roma.jpg, chile.jpg. Descomente a seção `assets` no
   pubspec.yaml. Troque `Image.network(widget.img, ...)` por
   `Image.asset(widget.img, ...)` em `destino.dart` e `checkout.dart`.
2. Ou deixe como está (via internet) — funciona igual, só muda a origem
   da imagem.

## Como rodar

1. Instalar as dependências do Flutter:
   flutter pub get

2. Instalar e rodar o Json Server (na raiz do projeto, onde estão db.json e
   routes.json):
   npm install -g json-server
   json-server --watch db.json --routes routes.json --port 3000

3. Rodar o app:
   flutter run

Login de teste (já cadastrado no db.json):
   email: teste@teste.com
   senha: 123456

4. Subir o projeto no GitHub para a entrega.

## Sobre o visual

Paleta: azul-marinho (#10263B), verde-petróleo (#0B3D3A), dourado (#D9A441),
coral (#E4572E) e areia clara (#FBF6EE). Tipografia serifada (Fraunces) nos
títulos e Work Sans no corpo do texto, via pacote google_fonts. Os cards de
destino seguem uma linguagem de "cartão-postal" com selo de preço, e a tela
de checkout imita um cartão de embarque com linha picotada separando os
dados da viagem do valor total.
