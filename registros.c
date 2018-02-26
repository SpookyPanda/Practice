#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

#define TAM 10

struct directorio
{
	char nombre[30],domicilio[50],cel[10];
	int edad;
}alumnos[TAM];

int main()
{
	int c=0,opc,main_loop=1,reg;
	char aux[30];

	while(main_loop==1)
	{
		system("cls");
		printf("\n\n\t1-Nuevo registro\n\t2-Mostrar registro\n\t3-Buscar registro\n\t4-Salir\n\tElija una opcion: ");
		scanf("%d",&opc);
			switch(opc)
		{
			case 1:
				printf("\n\n\t*CAPTURA DE REGISTRO*");
				printf("\n\n\tIngresa el nombre:\t");
				fflush(stdin);
				gets(alumnos[c].nombre);
				printf("\n\n\tIngresa el domicilio\t");
				fflush(stdin);
				gets(alumnos[c].domicilio);
				printf("\n\n\tIngresa el telefono:\t");
				scanf("%s",&alumnos[c].cel);
				printf("\n\n\tIngresa la edad\t\t");
				scanf("%d",&alumnos[c].edad);
				c++;
				break;
			case 2:
				printf("*\n\n\t*MOSTRAR REGISTRO*");
				printf("\n\n\tIngrese numero de registro:\t");
				scanf("%d",&reg);
				printf("\n\n\tRegistro %d",reg);
				printf("\n\tNombre:\t\t%s",alumnos[reg].nombre);
				printf("\n\tDomicilio:\t%s",alumnos[reg].domicilio);
				printf("\n\tCelular:\t%s",alumnos[reg].cel);
				printf("\n\tEdad:\t\t%d",alumnos[reg].edad);
				break;
			case 3:
				printf("\n\n\t*BUSCAR REGISTRO*");
				printf("\n\n\tIngresa registro a buscar: ");
				fflush(stdin);
				gets(aux);
				for (int i=0;i<10;i++)
				{
					if(strcmp(aux,alumnos[i].nombre)==0)
					{
						printf("\n\tRegistro encontrado\n\tRegistro #%d",i);
						break;
					}
					else if(i==9)
					{
						printf("\nNo se encontro el registro...");
					}
					printf("\n\n");
				}
					break;
			case 4:
				main_loop=0;
				break;
			default:
				printf("\n\nOpcion no valida.");
				break;
		}
		printf("\n\nPresione 'Enter' para continuar...");
		fflush(stdin);
		getchar();
	}
	return 0;
}