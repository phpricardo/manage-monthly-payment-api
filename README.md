# Mange Monthly Payment - API

Após clonar o projeto:

  * Alterar o usuário e senha do `database.yml`
  * Rodar o `bundle install`
  * Rodar as migration `rails db:create db:migrate`
  * Iniciar o servidor `rails s`

Logo, poderá acessar:

GET `http://localhost:3000/api/v1/students` Lista os Alunos

Exemplo de paramêtros de entrada:
```sh
{
  "page": 1,
  "count": 2
}
```

POST `http://localhost:3000/api/v1/students` Cadastra um Aluno

ex:
```sh
{
  "name": "Novo aluno",
  "cpf": "490.314.165-92",
  "birthdate": "23/10/1996",
  "payment_method": "boleto"
}
```

POST ` http://localhost:3000/api/v1/enrollments` Realiza a Matrícula

ex:
```sh
{
  "amount": 9000,
  "installments": 3,
  "due_day": 5,
  "student_id": 45
}
```
