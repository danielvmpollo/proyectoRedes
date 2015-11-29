require "net/ftp"
class ArchivosController < ApplicationController
	#GET /archivos
	def index
		@archivos = Archivo.all
	end

	#GET /archivos/:id
	def show
		@archivo = Archivo.find(params[:id])
	end
	#GET /archivos/new
	def new
		@archivo = Archivo.new
	end
	#POST /archivos
	def create
		arch = params[:archivo][:nombre]
		ftp = Net::FTP.new
		ftp.connect("192.168.5.170",21)
		ftp.login("danielvm","daniel123")
		ftp.getbinaryfile(arch, '/home/danielvm/Documentos/ftp/'+arch, 1024)
		ftp.close
		@archivo = Archivo.new(nombre: params[:archivo][:nombre], fecha:Time.now)
		@archivo.save
		redirect_to @archivo
	end
end