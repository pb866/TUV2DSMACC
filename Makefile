FC = gfortran

# FFLAGS = -g

SUB_PATH = ./subs
MODUL    = ./MOD/params.f90


MAIN_SRC = linkphot.f90

SRC = $(MODUL) $(SUB_PATH)/*.f90 $(MAIN_SRC)


EXE = linkphot

$(EXE) :
	$(FC) $(FFLAGS) $(SRC) -o $@

clean:
	rm -rf *.o
	rm -rf *.mod
	rm -f $(EXE)