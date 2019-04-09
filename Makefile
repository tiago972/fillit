CC = clang 
CFLAGS = -g3 -Wall -Wextra -Werror -I $(INCL)
OBJDIR = objs
SRCDIR = ./srcs
SRC = main.c \
	  error_handler.c \
	  parsing.c \
	  print.c \
	  bits.c
INCL = ./includes
LIBCREATOR = $(addprefix $(LIBDIR)/, $(LIB))
SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJ = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(basename $(SRC))))
NAME = fillit
include libft/Makefile

all: $(NAME)

$(NAME): $(OBJ) $(NAME_LIB)
	@$(CC) $(CFLAGS) -o $(NAME) $^
	@echo "\n\033[38;5;1;4;1m$(NAME)\033[0m is ready to be used\n"

$(OBJDIR)/%.o : $(SRCDIR)/%.c  
	@mkdir -p $(OBJDIR)
	@echo "\033[38;5;82m$@\033[0m has been created" 
	@$(CC) -o $@ -c $? $(CFLAGS) -I $(INCL)

clean: 
	@rm -rf $(OBJDIR)
	@echo "\033[38;5;208m$(OBJDIR)\033[0m has been deleted" 

fclean: clean
	@rm -f $(NAME)
	@echo "\033[38;5;208m$(NAME)\033[0m has been deleted" 

re: fclean all

fclean_all: fclean_lib fclean

re_all: fclean_lib re

debug:
	$(CC) -g3 $(CFLAGS) -o $(NAME) $(OBJ) $(NAME_LIB)

sanitize:
	$(CC) -fsanitize=address -fno-omit-frame-pointer -g3 $(CFLAGS) -o $(NAME) $(OBJ) $(NAME_LIB) 


