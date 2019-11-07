
class
	GAMEOFLIFE

inherit
	ARGUMENTS_32

create
	make

--Konstruktor? Mit den Attributen damit die Erstellung �ber Parameter diesen anspricht?
--Gittestcommend HIER HAT SICH WAS VER�NDERT GIT --> HIER <-- VER�NDERUNG!
feature {NONE} -- Initialization

	make
		local
			cell : EUKARYOTICCELLS

		-- Run application.
		do
			--| Add your code here
			create cellTest.make
			create grid.make_filled (cell, argument_array.item (2).to_integer, argument_array.item (3).to_integer)
		end

feature --Attributes
	grid : ARRAY2[EUKARYOTICCELLS]


feature
	update --Method to Update every cell in the grid for the next evolution.
		local
			i : INTEGER
			j : INTEGER

		do
			from
				i := grid.lower
			until
				i > argument_array.item (2).to_integer
			loop
				from
					j := grid.lower
				until
					j > argument_array.item (3).to_integer
				loop
					grid.item (i, j).next
					j := j + 1
				end
				i := i + 1
			end
		end

--Feature to draw the grid on the console.
--Attributes of the feature:
--INTEGER : i is used in the loop to count up.
--INTEGER : j is used in the loop to count up.
--No result.
feature

	draw
		local
			i : INTEGER
			j : INTEGER
		do
			from
				i := grid.lower
			until
				i > argument_array.item (2).to_integer
			loop
				from
					j := grid.lower
				until
					j > argument_array.item (3).to_integer
				loop
					if
						grid.item (i, j).alive
					then
						io.put_string ("#")
					else
						io.put_string ("-")
					end
					j := j + 1
					--Konsolenausgabe fehlt
				end
				io.new_line
				i := i + 1
			end
		end

end
