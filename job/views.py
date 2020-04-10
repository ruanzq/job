from django.shortcuts import render
def index(r):
    return render(r,'index.html',{})
def f04(request):
    return render(request,'404.html')
