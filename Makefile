CC = clang 
CFLAGS = -Wall -Wextra -Werror -I $(INCL)
OBJDIR = objs
SRCDIR = ./srcs
SRC = main.c
INCL = ./includes
LIB = libft.a
SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJ = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(basename $(SRC))))
NAME = fillit

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $? -I $(INCL) -L./libft -lft

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INCL) 

clean: 
	rm -f $(OBJ)
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

fromlbr: 
	make -C libft/
rmkfromlbr: fromlbr re
