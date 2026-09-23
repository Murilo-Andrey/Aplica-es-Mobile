# S&M Hotel

Como rodar:

1. Colocar as 10 imagens dos destinos dentro da pasta `images/` com estes nomes (referenciados no código):
   angra.jpg, jeri.jpg, arraial.jpg, flori.jpg, madri.jpg, paris.jpg, orlando.jpg, lasvegas.jpg, roma.jpg, chile.jpg

2. Instalar as dependências do Flutter:
   flutter pub get

3. Instalar e rodar o Json Server (na raiz do projeto, onde estão db.json e routes.json):
   npm install -g json-server
   json-server --watch db.json --routes routes.json --port 3000

4. Rodar o app:
   flutter run

Login de teste (já cadastrado no db.json):
   email: teste@teste.com
   senha: 123456

5. Subir o projeto no GitHub para a entrega.
