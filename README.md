# Manage Monthly Payment - API

Após clonar o projeto:

  * Alterar o usuário e senha do `database.yml`
  * Rodar o `bundle install`
  * Rodar rake de setup inicial `rails dev:setup`
  * Iniciar o servidor `rails s`

Logo, poderá acessar:

GET `http://localhost:3000/api/v1/students` Lista os Alunos

Exemplo de paramêtros de entrada:
```sh
{
  "page": 1,
  "count": 5
}
```

GET `http://localhost:3000/api/v1/enrollments` Lista as Matriculas

Exemplo de paramêtros de entrada:
```sh
{
  "page": 1,
  "count": 5
}
```


POST `http://localhost:3000/api/v1/students` Cadastra um Aluno

ex:
```sh
{
  "name": "Michael Jackson",
  "cpf": "490.314.165-92",
  "birthdate": "23/10/1996",
  "payment_method": "Boleto"
}
```

POST ` http://localhost:3000/api/v1/enrollments` Cadastra uma Matrícula

Essa rota requer atenticação basica usando os dados:

usarname: ```admin_ops```

password: ```billing```

ex:
```sh
{
  "amount": 12000,
  "installments": 3,
  "due_day": 5,
  "student_id": 1
}
```
