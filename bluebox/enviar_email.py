import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def email(subject, message, to_email):
   # Configurações do servidor SMTP
   smtp_server = 'mail.bluebox21.com.br'
   smtp_port = 465  # 465 Ou 587 para TLS/SSL
   smtp_user = 'contato@bluebox21.com.br'
   smtp_password = 'AnChCr2021!'

   # Dados do email
   sender_email = 'contato@bluebox21.com.br'
   receiver_email = to_email
   subject = subject
   body = message

   # print(assunto)
   # print(subject)
   # print(body)

   # Cria a mensagem
   message = MIMEMultipart()
   message['From'] = sender_email
   message['To'] = receiver_email
   message['Subject'] = subject
   message.attach(MIMEText(body, 'plain'))

   try:
      # Conecta ao servidor SMTP
      server = smtplib.SMTP_SSL(smtp_server, smtp_port)  # Use SSL/TLS
      # server = smtplib.SMTP(smtp_server, smtp_port)  # Se não for SSL/TLS
      # server.starttls() # Se não for SSL/TLS
      server.login(smtp_user, smtp_password)

      # Envia o email
      server.sendmail(sender_email, receiver_email, message.as_string())

      print("Email enviado com sucesso!")
      return "Email enviado com sucesso!"

   except Exception as e:
      print(f"Ocorreu um erro ao enviar o email: {e}")
      return f"Ocorreu um erro ao enviar o email: {e}"


   finally:
      # Fecha a conexão
      if 'server' in locals() and server:
          server.quit()