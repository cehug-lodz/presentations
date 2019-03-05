#include <stdio.h>
#include <libsoup/soup.h>
#include <glib.h>

int main(int argc, char *argv[]) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s <http-address>\n", argv[0]);
    return 1;
  }
  const char *dest = argv[1];

  SoupSession *session = soup_session_new();
  SoupMessage *msg = soup_message_new ("GET", dest);
  soup_session_send_message (session, msg);
  fwrite (msg->response_body->data,
          1,
          msg->response_body->length,
          stdout);
  g_object_unref(msg);
  g_object_unref(session);
}
