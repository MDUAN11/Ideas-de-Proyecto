# Reconstrucción filogenética de genes ortólogos en la familia Boidae

Este proyecto se centra en la reconstrucción filogenética de serpientes pertenecientes a la familia **Boidae**, analizando tres genes ortólogos: **FAP**, **FMNL2** e **IFIH1**. Las secuencias se descargan desde la base de datos NCBI, se alinean con **MUSCLE** y se analizan filogenéticamente con **IQ-TREE 2**. Finalmente, los árboles generados son visualizados con **FigTree**.

---

## Comenzando

Este instructivo te permitirá reproducir el análisis completo, desde la descarga de secuencias hasta la visualización de los árboles filogenéticos.

---

## Requisitos previos

- Acceso a una supercomputadora con sistema operativo Linux  
- Git Bash o terminal habilitada  
- Programas:
  - [`datasets`](https://www.ncbi.nlm.nih.gov/datasets/) de NCBI
  - [`MUSCLE`](https://www.drive5.com/muscle/) para alineamientos
  - [`IQ-TREE 2`](http://www.iqtree.org/) para inferencia filogenética
  - [`FigTree`](http://tree.bio.ed.ac.uk/software/figtree/) para visualización de árboles
  - `Atom` (opcional) para edición de archivos FASTA

---

## Estructura del proyecto

```
Ideas-de-Proyecto/
│
├── Data/
│   ├── FAP.fa
│   ├── FMNL2.fa
│   ├── IFIH1.fa
│   └── Alltrees.tree
│
├── Scripts/
│   ├── PROGRAMA.sh       # Alineamiento con MUSCLE
│   └── PROGRAMA2.sh      # Construcción de árboles con IQ-TREE
│
└── README.md
```

---

## Descarga y alineamiento de secuencias

### Descarga de genes ortólogos (ejemplo)
```bash
./datasets download gene symbol FAP --ortholog Boidae --filename FAP_Boidae.zip
./datasets download gene symbol FMNL2 --ortholog Boidae --filename FMNL2_Boidae.zip
./datasets download gene symbol IFIH1 --ortholog Boidae --filename IFIH1_Boidae.zip
```

### Extracción y organización
```bash
unzip FAP_Boidae.zip
mv ncbi_dataset/data/rna.fna FAP.fa
# Repetir para FMNL2 e IFIH1
mkdir Data
mv FAP.fa FMNL2.fa IFIH1.fa Data/
```

---

## Alineamiento y análisis filogenético

### Script 1 – Alineamiento con MUSCLE (`PROGRAMA.sh`)
```bash
cd Data
for archivo in *.fa ; do
  ./muscle3.8.31_i86linux64 -in $archivo -out aligned_$archivo -maxiters 1 -diags
done
```

### Script 2 – Árboles con IQ-TREE (`PROGRAMA2.sh`)
```bash
module load iqtree/2.2.2.6
for alineado in aligned_* ; do
  iqtree2 -s $alineado
done
cat *.treefile > Alltrees.tree
```

---

## Visualización

- Los archivos `.treefile` individuales y `Alltrees.tree` pueden ser visualizados en **FigTree**.

---

## Resultados

- Se alinearon los tres genes por separado.
- Se generaron árboles filogenéticos por cada gen.
- Se combinó todo en un único archivo `Alltrees.tree`.

---

## Autores

- **MIAO DUAN JIANG** — Análisis bioinformático y redacción del proyecto

---

## Licencia

Este proyecto se desarrolla con fines académicos en la carrera de Bioingeniería – PUCE.

---

## Agradecimientos

- A los docentes de la materia **Herramientas Bioinformáticas**  
- A **NCBI**, **MUSCLE**, **IQ-TREE 2** y **FigTree** por sus recursos abiertos

---

## Imagen del organismo

![Serpiente Boidae](https://t3.ftcdn.net/jpg/01/62/97/78/240_F_162977836_TO6ejAubuhvNeNFBRhfTNxGzwqYTc7m.jpg)
