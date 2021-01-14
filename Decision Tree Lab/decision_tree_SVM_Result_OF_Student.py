import pandas as pd
#from sklearn import tree
from sklearn.preprocessing import LabelEncoder




df = pd.read_csv('D:\BAIUST\CSE 441\Decision Tree Lab\CSE4-1.csv')

dataset = pd.DataFrame(df)

dataset = dataset.apply(LabelEncoder().fit_transform)




#df.shape

#le = LabelEncoder()
#dataset = le.fit(df)


X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,8].values



#X = le.LabelEncoder()


#y = le.fit_transform(Y)
#y = y.reshape(-1,1)


from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4)


#Decision Tree Classifier
from sklearn.tree import DecisionTreeClassifier
classifier = DecisionTreeClassifier(criterion="entropy", random_state=0)
classifier.fit(X_train, y_train)

y_pred = classifier.predict(X_test)

from sklearn.metrics import confusion_matrix, accuracy_score
cm = confusion_matrix(y_test, y_pred)
ac = accuracy_score(y_test, y_pred)

#SVM Classifier
from sklearn.svm import SVC
classifier1 = SVC(kernel = 'rbf',gamma='auto', random_state = 0)
classifier1.fit(X_train, y_train)

y_pred1 = classifier1.predict(X_test)
    
cm1 = confusion_matrix(y_test, y_pred1)
ac1 = accuracy_score(y_test, y_pred1)










