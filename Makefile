CC = clang 
CFLAGS = -Wall -Wextra -Werror -I $(INCL)
OBJDIR = objs
SRCDIR = ./srcs
SRC = main.c
INCL = ./includes
LIBCREATOR = $(addprefix $(LIBDIR)/, $(LIB))
SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJ = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(basename $(SRC))))
NAME = fillit
include libft/Makefile

all: $(NAME)

$(NAME): $(OBJ) $(NAME_LIB)
	$(CC) $(CFLAGS) -o $(NAME) $^ $(NAME_LIB)

$(OBJDIR)/%.o : $(SRCDIR)/%.c  
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $? $(CFLAGS) -I $(INCL)

clean: 
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
