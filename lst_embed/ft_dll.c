#include "lst_embed.h"
#include "tokenizer.h"

typedef struct t_test_node
{
	int		num;
	t_lst_embed	lst_data;
}	t_node;


// dll.h:
typedef	t_lst_embed	t_list_head;
typedef t_lst_embed	t_dll_node;


void	ft_dll_add_internal(t_dll_node *new, t_dll_node *prev, t_dll_node *next)
{
	new->next = next;
	new->prev = prev;
	prev->next = new;
	next->prev = new;
}

void	ft_dll_addfront(void *new, t_list_head *head)
{
	ft_dll_add_internal(new, head, head->next);
}

void	ft_dll_addback(void *new_node, t_list_head *head)
{
	ft_dll_add_internal(new_node, head->prev, head);
}

void	ft_dll_add(void *new, void *prev, void *next)
{
	ft_dll_add_internal(new, prev, next);
}

// This function assumes that the first member of the struct is t_lst_embed
void	ft_dll_list_for_each(t_dll_node *list_head, void (*iter_fn)(void *))
{
	t_lst_embed	*current;

	current = list_head->next;
	while (current != list_head)
	{
		iter_fn((void *)(current + sizeof(t_lst_embed)));
		current = current->next;
	}
}

void	ft_dll_init_head(t_list_head *list_head)
{
	list_head->next = list_head;
	list_head->prev = list_head;
}

int main()
{
	t_list_head	linked_list;
	t_lst_token	*new;

	ft_dll_init_head(&linked_list);

	new = malloc(sizeof(t_lst_token));
	ft_dll_add(new, &linked_list, linked_list.next);

	new = malloc(sizeof(t_lst_token));
	ft_dll_addfront(new, &linked_list);

	new->id = 1;
	//ft_lst_embed_addback(tok, next);
}
