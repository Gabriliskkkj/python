def solicitar_nota(mensagem):
    while True:
            try:
                  nota= float(input(mensagem))
                  return nota 
            except ValueError:
                  print("erro:por favor, insira um número valido.")

try:
    nota1 = solicitar_nota("digite a primeira nota:")
    nota2 = solicitar_nota("digite a segunda nota:")
    nota3 = solicitar_nota("digite a terceira nota:")
 
    media = (nota1 + nota2 + nota3) /3

    if media < 60:          
          print (f"Média: {media:.2f} - Reprovado")
    
    else:
          
          print (f"Média: {media:.2f} - Aprovado")

except Exception as e:
      print(f"Ocorreu um erro inesperado: {e}")
        



