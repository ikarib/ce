function plotce(U1,U2,ne,game)
% PLOTCE plots the set of correlated equilibria together with the convex hull of Nash equilibria
% in two player normal form game. U1 and U2 are n-by-m matrices of payoffs of two players.
% NE is the k-by-n+m matrix where each row represents Nash equilibria strategies of two players as returned from Gambit.
% GAME is the title to be shown on the plot.

if any(size(U1)~=size(U2))
    error('U1 and U2 must be of the same size')
end
[n,m]=size(U1); s1=ne(:,1:n); s2=ne(:,n+1:n+m);
if abs(sum(s1,2)-ones(size(ne,1),1))+...
   abs(sum(s2,2)-ones(size(ne,1),1))>10*eps
    error('Rows of Nash Equilibria strategies do not sum up to one.')
end
figure,hold on,grid on
k = convhull(U1,U2);
patch(U1(k),U2(k),'y','FaceAlpha',.5)
w=0:.01:1;
p=[ce(w,U1,U2,1)    % efficient correlated equilibria
   ce(w,U1,U2,-1)]; % inefficient correlated equilibria
Uce=unique(p*[U1(:) U2(:)],'rows');
if rank(Uce)>1
    kce=convhull(Uce(:,1),Uce(:,2));
    patch(Uce(kce,1),Uce(kce,2),ones(size(kce)),'EdgeColor','r')
else
    kce=1;
end
U1ne=sum((s1*U1).*s2,2);
U2ne=sum((s1*U2).*s2,2);
if size(ne,1)>2 && rank([U1ne,U2ne])>1
    kne=convhull(U1ne,U2ne);
    patch(U1ne(kne),U2ne(kne),'g')
    plot(U1ne(kne),U2ne(kne),'bo','MarkerSize',5)
else
    plot(U1ne,U2ne,'g.','MarkerSize',20)
end
plot(Uce(kce,1),Uce(kce,2),'ro','MarkerSize',5)
xlabel('U^1'),ylabel('U^2'),axis equal tight,title(game)
legend('set of correlated strategies','set of correlated equilibria',...
    'convex hull of Nash equilibria','Location','SouthOutside')