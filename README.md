# Reconstrucción filogenética de genes ortólogos en la familia Boidae

Este proyecto se centra en la reconstrucción filogenética de serpientes pertenecientes a la familia **Boidae**, analizando tres genes ortólogos mitocondriales: **COX3**, **ND4L** y **ND4**. Las secuencias se descargan desde la base de datos NCBI, se alinean con MUSCLE y se analizan filogenéticamente con IQ-TREE. Finalmente, los árboles generados son visualizados con FigTree.

---

## Comenzando

Este instructivo te permitirá reproducir el análisis en una supercomputadora, desde la descarga de secuencias hasta la visualización de árboles filogenéticos.

---

## Requisitos previos

- Acceso a una supercomputadora con ambiente Linux  
- Git Bash o terminal habilitada  
- Programas:
  - `datasets` de NCBI
  - `MUSCLE` para alineamientos
  - `IQ-TREE 2` para inferencia filogenética
  - `FigTree` para visualización de árboles
  - `Atom` (opcional) para edición de archivos FASTA

---

## Instalación y ejecución

```bash
# 1. Conexión a la supercomputadora
ssh dechavez@hoffman2.idre.ucla.edu

# 2. Solicitar nodo
qrsh

# 3. Ir al directorio de trabajo
cd $SCRATCH/Bioinformatica-PUCE/HerrBio/MOLS

# 4. Crear y preparar el entorno
mkdir IDEA-DE-PROYECTO
cp datasets IDEA-DE-PROYECTO/
cd IDEA-DE-PROYECTO/
```

### Descarga de genes ortólogos
```bash
./datasets download gene symbol COX3 --ortholog Boidae --filename COX3_Boidae.zip
./datasets download gene symbol ND4L --ortholog Boidae --filename ND4L_Boidae.zip
./datasets download gene symbol ND4 --ortholog Boidae --filename ND4_Boidae.zip
```

### Procesamiento de cada archivo ZIP
```bash
# COX3
unzip COX3_Boidae.zip
cd ncbi_dataset/data
mv rna.fna COX3.fa
cp COX3.fa ../../../
cd ../../../
rm -r ncbi_dataset

# (Repetir para ND4L y ND4)
```

### Organizar secuencias
```bash
cat *.fa > SECUENCIAS/
```

### Transferir a máquina local y editar
```bash
scp -r dechavez@hoffman2.idre.ucla.edu:/u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/MOLS/IDEA-DE-PROYECTO/SECUENCIAS ./
# editar con Atom
scp -r ./SECUENCIAS dechavez@hoffman2.idre.ucla.edu:/u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/MOLS/IDEA-DE-PROYECTO/
```

### Alineamiento y análisis
```bash
cd SECUENCIAS
cp ../../muscle3.8.31_i86linux64 ./

# Alinear con MUSCLE
for gene in *.fa ; do
  ./muscle3.8.31_i86linux64 -in $gene -out muscle_$gene -maxiters 1 -diags
done

# IQ-TREE
module load iqtree/2.2.2.6
for muscle in muscle_* ; do
  iqtree2 -s ${muscle}
done

# Unir árboles
cat *.treefile > Alltrees.tree
```

---

## Pruebas realizadas

- Se ejecutaron alineamientos individuales para los tres genes.  
- Se generaron árboles filogenéticos independientes para cada gen.  
- Los archivos `.tree` fueron visualizados con FigTree.

---

## Despliegue

No aplica despliegue en vivo. Todos los análisis se realizan en entorno local/supercomputadora.

---

## Construido con

- [MUSCLE](https://www.drive5.com/muscle/)
- [IQ-TREE 2](http://www.iqtree.org/)
- [FigTree](http://tree.bio.ed.ac.uk/software/figtree/)
- [NCBI datasets CLI](https://www.ncbi.nlm.nih.gov/datasets/)
- [Atom](https://atom.io/)

---

## Autores

- **[MIAO DUAN JIANG]** — Análisis bioinformático y redacción del proyecto

---

## Licencia

Este proyecto se desarrolla con fines educativos en la carrera de Bioingeniería – PUCE.

---

## Agradecimientos

- Al docent del curso de BIOTECNOLOGÍA Y HERR BIOINFOR [DANIEL CHAVEZ]  
- A NCBI por el acceso gratuito a datos genéticos  
- A las herramientas de software libre utilizadas en este trabajo

---

## Imagen del organismo

![Serpiente Boidae](https://t3.ftcdn.net/jpg/01/62/97/78/240_F_162977836_TO6ejAubuhvNeNFBRhfTNxGzwqYTc7m.jpg)

