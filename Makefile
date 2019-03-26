CC = clang 
CFLAGS = -Wall -Wextra -Werror -I $(INCL)
OBJDIR = objs
SRCDIR = ./srcs
SRC = main.c
INCL = ./includes
LIBDIR = ./libft
LIB = libft.a
LIBCREATOR = $(addprefix $(LIBDIR)/, $(LIB))
SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJ = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(basename $(SRC))))
NAME = fillit

all: $(NAME)

$(NAME): $(OBJ) $(LIBCREATOR)
	$(CC) $(CFLAGS) -o $(NAME) $(filter $^, $(OBJ)) -I $(INCL) -L$(LIBDIR) -lft

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INCL)

$(LIBDIR)/%.a:
	make -C $(LIBDIR)/

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
