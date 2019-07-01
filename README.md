# Dogs
Dogs - Lista de cães das raças: husky, hound, pug, labrador.<br><br>

Versão: 0.0.1<br>
Linguagem: Swift<br>

## Aplicativo

### 1 - Objetivo

Aplicativo que consulte a API https://api-iddog.idwall.co para registar um e-mail (sign up), e na sequênca, listar as raças e as imagens dos cães de cada raça.<br>

### 2 - Arquitetura

Arquitetura pensada para criar um aplicativo inspirado no Clean Archicture. Contendo um Core,
onde o conjunto de regras da aplicação fica disponível. Se eventualmente, precisar implementar
outra aplicação em Swift, o Core já estará pronto.<br>
Dentro da aplicação encontramos o Boundary, a Infrastructure e o Presentation.<br>
A Infrastructure é responsável por cuidar da camada externa da aplicação, como banco de
dados, serviços etc.<br> 
O Boundary é responsável por interligar as camadas externa com o Core.<br>
O Presentation cuida da apresentação das telas e de como os elementos visuais são montados.

### 3 - Libs

Segue a lista de libs usadas na atual versão do app:<br>
- **Kingfisher**: Biblioteca poderosa para baixar e armazenar em cache imagens da web. Muitos desenvolvedor contribuem com a melhoria e continuidade desta bibliote. Em relação a outra biblioteca popular o `SDWebImage`, o `Kingfisher` lida melhor com os avisos de memória. O `Kingfisher` foi criado em `Swift`.;<br>
- **Alamofire**: Uma das mais populares biblioteca para desenvolvimento iOS, e criada em `Swift`. Usada para fazer requisições na web. Porém, adicionei a dependência e não utilizei, como as requisições eram simples e com a evolução do `Swift`, não achei necessário o uso de uma biblioteca extra. O `Alamofire` é muito útil e simplifica a vida com coisas mais complexas como: `Solicitações: "tentando novamente"`. Quando uma solicitação falha, por exemplo, devido a uma falha de autenticação, você pode atualizar facilmente seu token de autenticação e invocar a mesma solicitação novamente sem tocar no código de implementação. Deixarei o (https://www.avanderlee.com/swift/alamofire-vs-urlsession/ "link") de um artigo do Antoine Van Der Lee comparando Alamofire e URLSession.

### 4 - Melhorias

Algumas melhorias para fazer na próxima versão do app:<br>
- Após criar um cadastro, sempre que acessar o app, direcionar para a tela de raças e imagens dos cães;<br>
- Botão para "deslogar" o usuário e direcionar o app para a tela de cadastro de e-mail;<br>
- Ampliar os testes unitários e de UI.

## Recursos

API<br>
https://api-iddog.idwall.co

Lib Kingfisher<br>
https://github.com/onevcat/Kingfisher

Lib Alamofire<br>
https://github.com/Alamofire/Alamofire

## Referências

herbertograca - DDD, Hexagonal, Onion, Clean, CQRS, … How I put it all together<br>
https://herbertograca.com/2017/11/16/explicit-architecture-01-ddd-hexagonal-onion-clean-cqrs-how-i-put-it-all-together/

Robert C Martin - Clean Archicture and Design<br>
https://www.youtube.com/watch?v=Nsjsiz2A9mg
https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html

SwiftLee - Alamofire vs URLSession: a comparison for networking in Swift<br>
https://www.avanderlee.com/swift/alamofire-vs-urlsession/