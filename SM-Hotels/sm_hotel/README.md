# S&M Hotel

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
