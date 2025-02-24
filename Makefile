NAME = minitalk
CLIENT = client
SERVER = server

SRCS_CLIENT = src/client.c
SRCS_SERVER = src/server.c

OBJS_CLIENT = $(SRCS_CLIENT:.c=.o)
OBJS_SERVER = $(SRCS_SERVER:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: $(CLIENT) $(SERVER)

$(CLIENT): $(OBJS_CLIENT)
	$(CC) $(OBJS_CLIENT) -o $(CLIENT)

$(SERVER): $(OBJS_SERVER)
	$(CC) $(OBJS_SERVER) -o $(SERVER)

%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS_CLIENT) $(OBJS_SERVER)

fclean: clean
	rm -f $(CLIENT) $(SERVER)

re: fclean all

.PHONY: all clean fclean re