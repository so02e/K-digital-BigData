from django.db import models

class Visitor(models.Model) :
    name = models.CharField(max_length=6)
    memo = models.TextField()
    writedate = models.DateTimeField(auto_now_add=True)

# {} 쓰는 이유는 오버라이딩? https://www.geeksforgeeks.org/change-object-display-name-using-__str__-function-django-models-python/
    def __str__(self):
        return "main {}-{}-{}".format(self.id, self.name, self.memo)


class Reply(models.Model):
    content = models.CharField(max_length=80)
    visitor = models.ForeignKey(Visitor, on_delete=models.CASCADE)

    def __str__(self):
        return "replay {}-{}-{}".format(self.id, self.content, self.visitor_id)

