PYTHON_BASE_DIR = $(HOME)/anaconda3
PYTHON_VERSION = 3.6m
TARGET = hello_ext

$(TARGET).so: $(TARGET).o
    g++ -shared -Wl,--export-dynamic $(TARGET).o \
        -L$(PYTHON_BASE_DIR)/lib -lboost_python \
        -L$(PYTHON_BASE_DIR)/python$(PYTHON_VERSION)/config \
        -lpython$(PYTHON_VERSION) \
        -o $(TARGET).so

$(TARGET).o: $(TARGET).C
    g++ -I$(PYTHON_BASE_DIR)/include/python$(PYTHON_VERSION) \
        -I$(PYTHON_BASE_DIR)/include \
        -fPIC -c $(TARGET).C
