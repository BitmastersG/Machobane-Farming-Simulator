#include <iostream>
using namespace std;

//--------------WINTER FIELD DIMENSIONS-----//
int winter_width;
int winter_length;
//----------------------------------------//

//---------------WINTER PLANTS-----------//
int wheat;
double wheat_harvest;
int peas;
double pea_harvest;
int potatoes = 0;
double potato_harvest = 0;
//---------------------------------------//

//--------SUMMER FIELD DIMENSIOMS-------//
int summer_width = 20, summer_length = 8;
//-------------------------------------//

//----------SUMMER PLANTS--------------//
int maize = 0;
double maize_harvest = 0;
int pumpkin = 0;
double pumpkin_harvest = 0;
int beans = 0;
double bean_harvest = 0;
int sorghum ;
double sorghum_harvest ;
int watermelon ;
double watermelon_harvest ;
int groundnuts ;
double groundnut_harvest ;
//----------------------------------//

//---------------------------------//
bool soil_ready = false; 
double soil_fertility = 1;

void reduce_soil_fertility(double num)
{
	if(soil_fertility=<num){
		soil_fertility = 0;
	}
	else{
		soil_fertility = soil_fertility - num;
	}
}
void addManure(){
	if(soil_fertility<0.7){
		soil_fertility+=0.3;
	}
	else{
		soil_fertility=1;
	}
	
}

void soilPreparation(){
	soil_ready=true;
	addManure();
	
}
//-------------------------------------//
//--------------WINTER SUBROUTINES---------//
void winterPlants(int rotation){
	soilPreparation();
	if(rotation){
		wheat = 4*19;
		wheat_harvest = wheat*44; //calculate the total mass of wheat harvested using the number of wheat plants and the average mass of one pea plant
	}
	else{
		potatoes = 4*10;
		potato_harvest = potatoes*5000; //calculate the toatl mass of potatoes using the number of potatoes planted and the average yield mass of a potato
	}
}

void winterRelayCropping(int rotation){
	if(rotation == 0) {
	peas = 4*10;
	pea_harvest = peas*280;
	}
}
void printWinterPlants(char first, char second)
{
	for(int i = 0; i<4; i++)
	{
		for(int j = 0; j<19; j++) {
			std::cout<<first;
			std::cout<<" ";
		}
		std::cout<<"\n";
		for(int k = 0; k<10; k++)
		{
			std::cout<<second;
			std::cout<<"   ";
		}
		std::cout<<"\n";
	}
}
void winterHarvest(int rotation)
{
	reduce_soil_fertility(0.25); //Plants absorb nutrients from the soil
	if(rotation){
		soil_fertility+=0.1; //legumes fix nitrogen in the soil
		pea_harvest = pea_harvest*soil_fertility;
		wheat_harvest = wheat_harvest*soil_fertility;
		std::cout<<"\n---------------Winter Harvest-----------\n";
		std::cout<<"Peas: "<<bean_harvest<<"g\n";
		std::cout<<"Wheat: "<<maize_harvest<<"g\n";
	}
	else{
		potato_harvest = potato_harvest*soil_fertility;
		std::cout<<"\n---------------Winter Harvest-----------\n";
		std::cout<<"Potatoes: "<<potato_harvest<<"g\n";
	}
}

//---------------------------------------//
//------------SUMMMER SUBROUTINES---------//
void summerPlants(int rotation){
	soilPreparation();
	if(rotation == 0){
		beans = 4*12;
		bean_harvest = 13.4 * beans; // mass in grams of maximum theoretical yield 
	}
	else{
		groundnuts = 4*12;
		groundnut_harvest = 70 * groundnuts;
	}
}
void summerRelayCropping(int rotation){
	if(rotation == 0){
		maize = 4*7;
		maize_harvest = 17.9*maize; //
		pumpkin = 4*4;
		pumpkin_harvest = 2267 * 12 * pumpkin; // mass in grams of pumpkins
	}
	else{
		sorghum = 4*7;
		sorghum_harvest = 1000 * sorghum;
		watermelon = 4*4;
		watermelon_harvest = 9000 * watermelon;
	}
}
void printSummerPlants(char first, char second, char third)
{
		for(int i = 0; i< (summer_length/2); i++){
			for(int j = 0; j< (summer_width/5); j++){
				std::cout<<first;
				for(int k = 0; k<21; k++) std::cout<<" ";
			}
			std::cout<<"\n\n";
			for(int m= 0; m<=summer_width/3; m++){
				std::cout<<second;
				for(int n = 0; n<10; n++) std::cout<<" ";
			}
			std::cout<<"\n\n";
			for(int o = 0; o<=(summer_width/2)+1; o++){
				std::cout<<third;
				for(int p = 0; p<5; p++) std::cout<<" ";
			}
			std::cout<<"\n\n";		
		}
}
void summerHarvest(int rotation){
	reduce_soil_fertility(0.1);
	if(rotation){
		soil_fertility+=0.1;
		bean_harvest *= soil_fertility;
		maize_harvest*=soil_fertility;
		pumpkin_harvest*=soil_fertility;
		std::cout<<"\n---------------Summer Harvest-----------\n";
		std::cout<<"Beans: "<<bean_harvest<<"g\n";
		std::cout<<"Maize: "<<maize_harvest<<"g\n";
		std::cout<<"Pumpkin: "<<pumpkin_harvest<<"g\n";
		
	}
	else{
		soil_fertility+=0.1;
		groundnut_harvest*=soil_fertility;
		watermelon_harvest*=soil_fertility;
		sorghum_harvest*=soil_fertility;
		std::cout<<"\n---------------Summer Harvest-----------\n";
		std::cout<<"Groundnuts: "<<groundnut_harvest<<"g\n";
		std::cout<<"Sorghum: "<<sorghum_harvest<<"g\n";
		std::cout<<"Watermelon: "<<watermelon_harvest<<"g\n";
	}
}
//------------------------------------------//



int main()
{
	int count = 0;
	while(true)
	{
		winterPlants(count);
		winterRelayCropping(count);
		reduce_soil_fertility(0.15);
		if(count){
			std::cout<<"------------WINTER---------------\n";
			cout<<"April: Planting of wheat:\n";
			printWinterPlants('K', ' ');
			std::cin.get();
			system("cls");
			std::cout<<"------------WINTER---------------\n";
			cout<<"May: Relay cropping of peas with wheat:\n";
			printWinterPlants('K', 'P');
			std::cin.get();
			system("cls");
			std::cout<<"\n-------Winter Season Report----------\n";
			std::cout<<"Peas: 90% Growth\n";
			std::cout<<"Wheat: 60% Growth\n";
			std::cout<<"Soil Fertility: "<<soil_fertility<<"\n";
			std::cout<<"Expected Yield\n";
			std::cout<<"Peas: "<<pea_harvest*soil_fertility<<"g\n";
			std::cout<<"Wheat: "<<wheat_harvest*soil_fertility<<"g\n";
			std::cout<<"---------End of Report-----------------\n";
		}
		else{
			std::cout<<"------------WINTER---------------\n";
			cout<<"May: Planting of Tapole\n";
			printWinterPlants(' ', 'T');
			std::cin.get();
			system("cls");
			std::cout<<"\n-------Winter Season Report----------\n";
			std::cout<<"Potatoes: 40% Growth\n";
			std::cout<<"Soil Fertility: "<<soil_fertility<<"\n";
			std::cout<<"Expected Yield\n";
			std::cout<<"Potatoes : "<<potato_harvest*soil_fertility<<"g\n";
			std::cout<<"---------End of Report-----------------\n";
		}
		std::cin.get();
		system("cls");
		summerPlants(count);
		summerRelayCropping(count);
		winterHarvest(count);
		std::cin.get();
		system("cls");
		if(count){
			std::cout<<"------------SUMMER---------------\n";
			std::cout<<"August: Beans\n";
			printSummerPlants(' ', ' ', 'B');
			std::cin.get();
			system("cls");
			std::cout<<"------------SUMMER---------------\n";
			std::cout<<"September: Relay cropping of beans with maize and pumpkin\n";
			printSummerPlants('P', 'M', 'B');
			reduce_soil_fertility(0.2);
			std::cin.get();
			system("cls");
			std::cout<<"\n-------Summer Season Report----------\n";
			std::cout<<"Beans: 90% Growth\n";
			std::cout<<"Maize: 60% Growth\n";
			std::cout<<"Pumpkin: 50% Growth\n";
			std::cout<<"Soil Fertility: "<<soil_fertility<<"\n";
			std::cout<<"Expected Yield\n";
			std::cout<<"Beans: "<<bean_harvest*soil_fertility<<"g\n";
			std::cout<<"Maize: "<<maize_harvest*soil_fertility<<"g\n";
			std::cout<<"Pumpkin: "<<pumpkin_harvest*soil_fertility<<"g\n";
			std::cout<<"---------End of Report-----------------\n";
			
		}
		else{
			std::cout<<"------------SUMMER---------------\n";
			cout<<"August: Planting of Groundnuts\n";
			printSummerPlants(' ', ' ', 'G');
			std::cin.get();
			system("cls");
			std::cout<<"------------SUMMER---------------\n";
			cout<<"September: Relay cropping of groundnuts with sorghum and watermelon\n";
			printSummerPlants('W', 'S', 'G');
			reduce_soil_fertility(0.2);
			std::cin.get();
			system("cls");
			std::cout<<"\n-------Summer Season Report----------\n";
			std::cout<<"Groundnuts: 90% Growth\n";
			std::cout<<"Sorghum: 60% Growth\n";
			std::cout<<"Watermelon: 50% Growth\n";
			std::cout<<"Soil Fertility: "<<soil_fertility<<"\n";
			std::cout<<"Expected Yield\n";
			std::cout<<"Groundnuts: "<<groundnut_harvest*soil_fertility<<"g\n";
			std::cout<<"Sorghum: "<<sorghum_harvest*soil_fertility<<"g\n";
			std::cout<<"Watermelon: "<<watermelon_harvest*soil_fertility<<"g\n";
			std::cout<<"---------End of Report-----------------\n";
		}
		std::cin.get();
		system("cls");
		summerHarvest(count);
		
		std::cin.get();
		system("cls");
		
		count++;
		
		count = count%2;
	}
}