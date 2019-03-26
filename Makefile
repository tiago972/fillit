CC = clang 
CFLAGS = -Wall -Wextra -Werror -I $(INCL)
OBJDIR = objs
SRCDIR = ./srcs
SRC = main.c
INCL = ./includes
LIBDIR = ./libft
LIB = lft
SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJ = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(basename $(SRC))))
NAME = fillit

all: $(NAME)

$(NAME): $(OBJ) | $(LIB)
	$(CC) $(CFLAGS) -o $(NAME) $? -I $(INCL) -L$(LIBDIR) -$(LIB)

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INCL)

$(LIB): 
	@make -C $(LIBDIR)/

cleanlib:
	make clean -C $(LIBDIR)/

fcleanlib:
	make clean -C $(LIBDIR)/

makerelib:relib all

relib:
	make re -C $(LIBDIR)/

clean: 
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
