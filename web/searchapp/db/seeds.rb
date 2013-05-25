# encoding: utf-8
contents = [
	"Es raro que una persona que haya vivido en el barrio",
	"madrileño de Lavapiés, en los años 50, no recuerde a",
	"Gloria Domínguez Carpio. Era una mujer muy poco agraciada,",
	"solterona y sin ningún pretendiente, se ganaba la vida ",
	"fregando suelos, no tenía familiares cercanos ni amigos,",
	"su casa era una habitación sin ventanas y, en resumen, su ",
	"existencia se limitaba a trabajar y a dormir, pero todos la",
	"envidiaban. Se la veía feliz.",
	"Algunos de los que rozaron por instantes la vida de Gloria ",
	"no perdieron la oportunidad de preguntarle —con más indiscreción que sutileza—",
	"cuál era la razón de su desconcertante estado anímico. Y, palabras textuales de la",
	"señora Domínguez: La gente me tomaba por una jovencita loca, por una loca clínica",
	"4",
	"ear",
	"lid",
	"see",
	"En las distancias largas, lo único que importa es llegar a un reinado sin brillo llamado resistencia.",
	"Los que entrenan para la superación continua saben que el secreto está en cruzar la extenuación y cambiar el aire para volver a empezar.",
	"La única meta está en encontrarla.",
	"A Sara Stewart Brown (38) le gusta probarse en los 42 kilómetros de las maratones.",
	"Estuvo en la de Nueva York, estará en septiembre en la de Berlín, cruzó dos veces la cordillera de los Andes en tres días.",
	"Se define “lenta” pero aguantadora: “Las termino”, dice y se ríe, dato que será redundante señalar porque Sara sonríe todo el tiempo y no por diplomacia.",
	"Sus pequeños ojos negros chispean algo vital muy parecido a la alegría.",
	"Sara Stewart Brown: Empecé a correr porque engordé como 30 kilos con el embarazo de Lola y no pienso entrar",
	"más a un gimnasio. Me gusta la vida sana, dejé de fumar hace dos años.",
	"Correr es mi espacio. Por supuesto, Lanata me dice que estoy demente pero me entiende y le da curiosidad.",
	"Lola tiene ocho años y es la única hija de Sara y Jorge Lanata, su marido desde septiembre del 2011 y pareja desde",
	"1998. Él tiene otra hija, Bárbara, de 23, que tuvo con Andrea Rodríguez, periodista y productora del programa",
	"“Periodismo Para Todos (PPT)” que conduce su ex los domingos por El Trece.",
	"Stewart Brown llama a Jorge, “Lanata”, y Lanata llama a Sara, “Kiwi”. Ambos, además, se tratan de “usted”.",
	"Stewart: Surgió como un código nuestro muy al principio de la relación y después quedó, aunque estuviera todo mal. Hubo un momento en que si nos peleábamos, salía el tuteo pero después no, ya no, y siempre nos tratamos de usted.",
	"NOTICIAS: ¿Me alcanzaría la sal, Kiwi? ¿Por qué?",
	"Stewart: La historia es así: un abuelo de mi abuelo era ingeniero, hacía puentes y trabajó en Nueva Zelanda.",
	"Hay una islita al Sur que se llama Stewart por este antepasado y Lanata se puso a ver qué había ahí.",
	"Y había un pájaro llamado kiwi, feo, marrón, muy simpático, que no vuela. Desde entonces me llama así y los que me conocen desde entonces también.",
	"En la casa paterna, “Kiwi” es Sara o Sarita, hija de hijos de ingleses establecidos, como otros inmigrantes traídos por el ferrocarril, en Quilmes,",
	"al sudeste del conurbano, donde se crió junto a su hermano, seis años mayor. ",
	"El papá es capitán de barcos de carga, ya retirado, y la mamá es profesora de inglés y ama de casa. ",
	"Que Sara tuviera sus primeros trabajos como traductora en medios periodísticos fue consecuencia lógica de haber crecido en un hogar bilingüe.",
	"NOTICIAS: ¿Te anotaron con los dos apellidos?",
	"Stewart: Porque yo soy adoptada y en esa época la ley pedía los dos apellidos. ¡Menos mal que pegaban entre sí! Son dos apellidos muy comunes: Stewart en Escocia y Brown en Irlanda.",
	"NOTICIAS: ¿Tu hermano también es adoptado?",
	"Stewart: Sí. Me lo contaron a los cuatro años, cuando los chicos empiezan a preguntar de dónde vienen.",
	"Y se naturalizó, claro, a esa edad pensaba que todos los chicos nacían de cualquier mamá. ",
	"Después se fue acomodando. Pero nunca hice terapia. Siempre se habló en mi casa, jamás nos ocultaron nada ni a mí ni a mi hermano.",
	"NOTICIAS: ¿Tus viejos son como esos ingleses que viven adentro de una tetera?",
	"Stewart: Y sí, más o menos. Pero son ingleses del Sur, sin pretensiones."
]

Tire.index(:articles).delete

puts "Creating articles..."
contents.each_with_index do |a_content, i|
	title = RandomWord.nouns.next
	title.sub! "_", " "
  Article.create :title => title, :content => a_content, :published_on => i.days.ago.utc
end

20.times.each_with_index do |i|
	title = RandomWord.nouns.next
	title.sub! "_", " "
	content = RandomWord.nouns.next
	content.sub! "_", " "
  Article.create :title => title, :content => content, :published_on => i.days.ago.utc
end
