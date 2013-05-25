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
	"see"
]

Tire.index(:articles).delete

puts "Creating articles..."
%w[ Uno Dos Tres Cuatro Cinco Seis Siete Ocho Nueve Diéz Once Doce 4 ear lid see ].each_with_index do |title, i|
  Article.create :title => title, :content => contents[i], :published_on => i.days.ago.utc
end

