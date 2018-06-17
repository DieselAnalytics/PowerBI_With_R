normalize.into.range <-
	function(numeric.vector, lb, ub) {
		if (is_numeric(numeric.vector)) {

		min.value = min(numeric.vector)
		max.value = max(numeric.vector)

		round(
			(lb + (numeric.vector - min.value) * (ub - lb)) /
			(max.value - min.value)
		    ,1
		)

    } else {
		NA
	}
}

mydata <- c(0,10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
a <- normalize.into.range(mydata,1,10)
