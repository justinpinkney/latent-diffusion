train:
	python main.py --base custom-ldm-vq-4.yaml -t --gpus 0,1 --logs logs
finetune:
	python main.py --base custom-ldm-vq-4.yaml -t --gpus 0, --logs logs

inf:
	cp logs/2022-04-13T10-25-18_custom-ldm-vq-4/configs/2022-04-13T10-25-18-project.yaml logs/2022-04-13T10-25-18_custom-ldm-vq-4/checkpoints/config.yaml
	python scripts/sample_diffusion.py -r logs/2022-04-13T10-25-18_custom-ldm-vq-4/checkpoints/last.ckpt  -n 4 --batch_size 4 -c 50
inf-ffhq:
	python scripts/sample_diffusion.py -r models/ldm/ffhq256/model.ckpt -n 2 --batch_size 2 -c 50

build:
	docker build -t ldm .

datadir = /data/afhqv2
run:
	docker run --gpus all -it --rm --ipc=host -v $(PWD):/workspace/ -v $(datadir):/data ldm