/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import model.Reserva;

/**
 *
 * @author esdras copado
 */
public class enviarCorreo {

    public boolean EmailSender(Reserva res) {
        final String username = "copadoe6@gmail.com"; // Cambiar al correo emisor
        final String password = "hrap honr pnzk bzwz"; // Cambiar a la contraseña del correo emisor

        // Propiedades para la configuración del servidor SMTP de Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Crear una sesión de correo con autenticación
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Crear un mensaje de correo electrónico
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // Remitente
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(res.getNombreCliente())); // Destinatario
            message.setSubject("Recivo de Renta Todo para tu fiesta"); // Asunto
        String htmlContent = "<!DOCTYPE html>" +
                                    "<html lang=\"es\">" +
                                    "<head>" +
                                        "<style>" +
                                            "/* Estilos CSS */" +
                                            "body {" +
                                                "margin: 0;" +
                                                "font-size: 16px;" +
                                                "font-family: \"Roboto Slab\", -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;" +
                                            "}" +
                                            ".masthed {" +
                                                "text-align: center;" +
                                                "color: #fff;" +
                                                "background-image: url(\"http://proyectoesdrascopado.com/assets/img/header-bg.jpg\");" +
                                                "background-repeat: no-repeat;" +
                                                "background-attachment: scroll;" +
                                                "background-position: center center;" +
                                                "background-size: cover;" +
                                                "height: 400px;" +
                                                "display: flex;" +
                                                "justify-content: center;" +
                                                "align-items: center;" +
                                            "}" +
                                            ".masthed-subheding, .masthead-heading {" +
                                                "font-size: 48px;" +
                                                "margin-bottom: 10px;" +
                                            "}" +
                                        "</style>" +
                                    "</head>" +
                                    "<body>" +
                                        "<header class=\"masthed\">" +
                                            "<div class=\"container\">" +
                                                "<div class=\"masthed-subheding\">Proyecto Final: Aplicaciones Web</div>" +
                                                "<div class=\"masthead-heading text-uppercase\">TODO PARA TU FIESTA</div>" +
                                            "</div>" +
                                        "</header>" +
                                        "<h1>Resivo de Reservación Todo Para tu Fiesta</h1>"+
                                        "<h3>NombreComprador: "+res.getNombreCliente()+" </h3>"+
                                        "<h3>Articulos Rentados: "+res.getNombreArticulo()+"</h3>"+
                                        "<h3>Fecha de Compra: "+res.getFechaCompra().toString()+"</h3>"+
                                        "<h3>PrecioTotal: "+res.getPrecioTotal()+"</h3>"+
                                    "</body>" +
                                    "</html>";
            
            // Establecer el cuerpo del mensaje como HTML
            message.setContent(htmlContent, "text/html");
            

            // Enviar el mensaje
            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            
        }
        return false;
    }

}
