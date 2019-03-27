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
	$(CC) $(CFLAGS) -o $(NAME) $^

$(OBJDIR)/%.o : $(SRCDIR)/%.c  
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $? $(CFLAGS) -I $(INCL)

clean: 
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

fclean_all: fclean_lib fclean

re_all: fclean_lib re

debug:
	$(CC) -g3 $(CFLAGS) -o $(NAME) $(OBJ) $(NAME_LIB)

sanitize:
	$(CC) -fsanitize=address -fno-omit-frame-pointer -g3 $(CFLAGS) -o $(NAME) $(OBJ) $(NAME_LIB) 


