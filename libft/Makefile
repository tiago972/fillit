LIB_DIR = libft
NAME_LIB = $(LIB_DIR)/libft.a
INCL_LIB = -I ./$(LIB_DIR)/includes
OBJDIR_LIB = $(LIB_DIR)/objs
SRCDIR_LIB = $(LIB_DIR)/srcs
SRC_LIB = ft_putchar.c ft_putstr.c ft_putnbr.c \
	   ft_strcat.c ft_strlen.c ft_strdup.c \
	   ft_strcmp.c ft_atoi.c ft_memset.c \
	   ft_bzero.c ft_memcpy.c ft_memchr.c \
	   ft_memcmp.c ft_strcpy.c ft_memccpy.c \
	   ft_strncpy.c ft_strncat.c ft_strchr.c \
	   ft_strrchr.c ft_strstr.c ft_strnstr.c \
	   ft_strncmp.c ft_isalpha.c ft_isdigit.c \
	   ft_isalnum.c ft_isprint.c ft_isascii.c \
	   ft_memmove.c ft_strlcat.c ft_tolower.c \
	   ft_toupper.c ft_memalloc.c ft_memdel.c \
	   ft_strnew.c ft_strdel.c ft_strclr.c \
	   ft_striter.c ft_striteri.c ft_strmap.c \
	   ft_strmapi.c ft_strequ.c ft_strnequ.c \
	   ft_strsub.c ft_strjoin.c ft_strtrim.c \
	   ft_strsplit.c ft_print_words_tables.c \
	   ft_itoa.c ft_strrev.c ft_putendl.c \
	   ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c \
	   ft_putnbr_fd.c ft_lstnew.c ft_lstdelone.c \
	   ft_lstdel.c ft_lstadd.c ft_lstiter.c ft_lstmap.c \
	   ft_realloc.c ft_putchar_err.c ft_putstr_err.c
SRCS_LIB = $(addprefix $(SRCDIR_LIB)/, $(SRC_LIB))
OBJ_LIB = $(addprefix $(OBJDIR_LIB)/, $(addsuffix .o, $(basename $(SRC_LIB))))

all: $(NAME_LIB)

$(NAME_LIB): $(OBJ_LIB)
	@ar rc $(NAME_LIB) $?
	@ranlib $(NAME_LIB)
	@echo "\n\033[38;5;4;1;4m$(NAME_LIB)\033[0m compiled successfully\n" 

$(OBJDIR_LIB)/%.o : $(SRCDIR_LIB)/%.c
	@mkdir -p $(OBJDIR_LIB)
	@$(CC) -o $@ -c $< $(INC_LIB)
	@echo "\033[38;5;82m$@\033[0m has been created" 

clean_lib: 
	@rm -rf $(OBJDIR_LIB)
	@echo "\033[38;5;208m$(OBJDIR_LIB)\033[0m has been deleted" 

fclean_lib: clean_lib
	@rm -rf $(NAME_LIB)
	@echo "\033[38;5;208m$(NAME_LIB)\033[0m has been deleted" 

re_lib: fclean_lib $(NAME_LIB)
