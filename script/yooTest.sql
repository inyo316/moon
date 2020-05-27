select user(), database();

select * from cafe; -- 카페
select * from board; -- 게시판
select * from users; -- 회원 현황
select * from admin; -- 관리자
select * from theme; -- 테마 분류
select * from zone; -- 위치 분류
select * from reply; -- 댓글 테이블
select * from boardkinds; -- 게시판 분류
select * from menukinds; -- 메뉴 분류
select * from menu; -- 메뉴
select * from starpoint; -- 별점
select * from type; -- 회원 타입
select * from grade; -- 회원 등급
select * from authority; -- 관리자 권한
select * from wishlist; -- 위시리스트
select * from image; -- 이미지
select * from vote; -- 추천리스트
select * from starpoint; -- 별점 리스트



-- test ------------------------------------------------------------------------------
select * from cafe where cafe_name like '%슬%';

select * 
	from cafe c left join image i on c.cafe_no = i.cafe_no
	where c.cafe_no = 4 limit 1;

select * from users where user_id = 'hceo1004';
select * from image where board_no = 1;
select * from image where cafe_no = 1;
select * from board b left join image i on b.board_no = i.board_no;

/*insert into board(board_no2 , user_no , cafe_no , writing_title , writing_content) values
(1, 2, 2, '카페 루시드 탐방기', '<p>카페 루시드 탐방기~~~</p>');

insert into image(image_name , board_no ) values('/2020/05/15/s_f62c7cca-3f04-4a51-b540-911512f55698_23g-1.jpg', 1);*/


select count(*) from board;
select last_insert_id();

-- insert into image(image_name , board_no ) values('/2020/05/15/s_f62c7cca-3f04-4a51-b540-911512f55698_23g-1.jpg', );

select u.user_no , u.user_id , u.name , u.user_grade , g.user_grade_name 
	from users u left join grade g on u.user_grade = g.user_grade;

-- update users set user_grade = 1	where user_no = 3;

select count(*), b.user_no, u.name , u.user_grade from board b left join users u on b.user_no = u.user_no where b.user_no = 3;

select * 
	from board b left join image i on b.board_no = i.board_no 
	where board_no2 = 1
	order by b.board_no desc limit 0, 20;

select * from board;
select count(*) as reply_cnt
	from reply
	where board_no = 1;

select u.nick , u.user_id , u.user_grade , g.user_grade_image , b.board_no , 
		b.view_number , b.writing_title , b.registration_date , b.writing_content , b.vote_number , b.reply_cnt ,
		z.zone_no , z.zone_name , t.theme_no , t.theme_name , c.cafe_name ,i.image_name 
	from board b left join image i on b.board_no = i.board_no 
				 left join users u on b.user_no = u.user_no 
				 left join grade g on u.user_grade = g.user_grade 
				 left join cafe c on b.cafe_no = c.cafe_no 
				 left join zone z on c.zone_no = z.zone_no 
				 left join theme t on c.theme_no = t.theme_no 
	            where b.board_no2 = 1 and b.board_del_cdt = 1 and c.theme_no = 6 
	            order by b.board_no desc limit 0, 20; 


select s.cafe_no , s.theme_no, t.theme_name, c.theme_no,count(s.theme_no) as cnt
	from starpoint s left join theme t on s.theme_no = t.theme_no left join cafe c on s.cafe_no = c.cafe_no 
	where s.cafe_no = 46 and s.theme_no != c.theme_no 
	group by s.theme_no 
	order by cnt desc, s.theme_no limit 2;

select u.nick , u.user_id , u.user_grade , g.user_grade_image , b.board_no , 
		b.view_number , b.writing_title , b.registration_date , b.writing_content , b.vote_number , b.reply_cnt ,
		z.zone_no , z.zone_name , t.theme_no , t.theme_name , c.cafe_name ,i.image_name , 
	from board b left join image i on b.board_no = i.board_no 
				 left join users u on b.user_no = u.user_no 
				 left join grade g on u.user_grade = g.user_grade 
				 left join cafe c on b.cafe_no = c.cafe_no 
				 left join zone z on c.zone_no = z.zone_no 
				 left join theme t on c.theme_no = t.theme_no,
				 (select count() from starpoint)
	where b.board_no2 = 1 and b.board_del_cdt = 1 and t.theme_no = 1
	order by b.vote_number desc limit 0, 20; 



select count(b.board_no) 
	from board b left join image i on b.board_no = i.board_no 
				 left join users u on b.user_no = u.user_no 
				 left join grade g on u.user_grade = g.user_grade 
				 left join cafe c on b.cafe_no = c.cafe_no 
				 left join zone z on c.zone_no = z.zone_no 
				 left join theme t on c.theme_no = t.theme_no 
	where z.zone_no = 3 and board_no2 = 1 ;

select u.nick , u.user_id , u.user_grade , g.user_grade_image , b.board_no , 
		b.view_number , b.writing_title , b.registration_date , b.writing_content , b.vote_number , b.reply_cnt ,
		z.zone_no , z.zone_name , t.theme_no , t.theme_name , c.cafe_name ,i.image_name 
	from board b left join image i on b.board_no = i.board_no 
				 left join users u on b.user_no = u.user_no 
				 left join grade g on u.user_grade = g.user_grade 
				 left join cafe c on b.cafe_no = c.cafe_no 
				 left join zone z on c.zone_no = z.zone_no 
				 left join theme t on c.theme_no = t.theme_no
	where c.cafe_no = 7 and b.board_no != 12;

select count(*) 
	from board b left join cafe c on b.cafe_no = c.cafe_no 
	where c.cafe_no = 7 and b.board_no != 12;

-- 수정
-- update image set image_name = ? where board_no = ?;
/*update board 
	set writing_title = ?, writing_content = ?, update_date = now()
	where board_no = ?*/

-- 삭제 여부 변경
update board 
	set board_del_cdt = 1
	where board_no = 210;

select * from image where board_no = 2;
select * from board where board_no = 210;

update board 
	set registration_date = '2020-05-18', update_date = '2020-05-18'
	where board_no = 210;

-- 좋아요(추천수)
select board_no , vote_number from board;
-- update board set vote_number = vote_number + 1 where board_no = 1;
-- update board set vote_number = vote_number - 1 where board_no = 1;

select vote_number from board where board_no = 211;
select * from vote where board_no = 211;

-- 추천 추가
-- insert into vote(board_no, user_no) values(211, 3);
-- 추천 취소
-- delete from vote where board_no = 211 and user_no = 3;
-- 변경된 추천 갯수 게시판 테이블에 추가
/*update board 
	set vote_number = (select count(*) from vote where board_no = 211)
	where board_no = 211;*/

-- 댓글
/*
insert into reply(board_no, user_no, comment_content) values(211, 3, '댓글 테스트');
update reply 
	set comment_content = '댓글 수정 테스트', update_date = now()
	where comment_no = 4;
delete from reply where comment_no = 4;
*/

select * from reply;

select r.comment_no , r.board_no , u.user_grade, g.user_grade_image, 
	   u.user_no, u.user_id, u.nick, r.comment_content, r.update_date 
	from reply r left join users u on r.user_no = u.user_no 
				left join grade g on u.user_grade = g.user_grade 
	where board_no = 210 
	order by comment_no desc;

select r.comment_no , r.board_no , u.user_grade, g.user_grade_image, 
		u.user_no, u.user_id, u.nick, r.comment_content, r.update_date 
	from reply r left join users u on r.user_no = u.user_no 
				left join grade g on u.user_grade = g.user_grade 
	where comment_no = 16;

select count(board_no) from reply where board_no = 211;

-- 탐방기 베스트 
select v.board_no , num.cnt , b.writing_title , b.reply_cnt 
	from vote v left join board b on v.board_no = b.board_no, 
	(select board_no, count(board_no) as cnt  from vote where month(vote_date) = month(now())-1 group by board_no) num
	where v.board_no = num.board_no and b.board_no2 = 1
	group by board_no
	order by num.cnt desc, v.board_no limit 10;

select reply_cnt from board where board_no = 85;

select board_no, count(board_no) as cnt  from vote where month(vote_date) = month(now())-1 group by board_no order by cnt desc;
select board_no, count(board_no) as cnt  from vote group by board_no order by cnt desc;
select * from vote where month(vote_date) = month(now())-1;

select month(now()) - 1 ;


-- 테마 순위
select s.cafe_no , s.theme_no, t.theme_name, c.theme_no, count(s.theme_no) as cnt
	from starpoint s left join theme t on s.theme_no = t.theme_no left join cafe c on s.cafe_no = c.cafe_no 
	where s.cafe_no = 1 and s.theme_no != c.theme_no 
	group by s.theme_no 
	order by cnt desc, s.theme_no limit 2;

select s.cafe_no , s.theme_no, t.theme_name, c.theme_no,count(s.theme_no) as cnt
	from starpoint s left join theme t on s.theme_no = t.theme_no left join cafe c on s.cafe_no = c.cafe_no 
	where s.cafe_no = 10
	group by s.theme_no 
	order by cnt desc, s.theme_no;

select * from starpoint where cafe_no = 4 and theme_no = 6;
select * from theme;
select * from cafe where cafe_no = 46;

-- 메인 카페 검색
select * from cafe where theme_no = 1 or theme_no = 3;

select c.cafe_no, c.cafe_name, z.zone_no , z.zone_name, t.theme_name, t.theme_no, c.registration_date, c.vote_number, c.view_number, 
		c.oneline, c.address, c.detail_address 
	from cafe c left join theme t on c.theme_no = t.theme_no left join `zone` z on c.zone_no = z.zone_no
	where c.zone_no = 3 and (c.theme_no in (2));

select c.cafe_no, c.cafe_name, z.zone_no , z.zone_name, t.theme_name, t.theme_no, c.registration_date, c.vote_number, c.view_number, 
		c.oneline, c.address, c.detail_address 
	from cafe c left join theme t on c.theme_no = t.theme_no left join `zone` z on c.zone_no = z.zone_no
	where (c.theme_no in (1));

select count(cafe_no) from cafe c where (c.theme_no in (1, 3)) and theme_no = 1;
select count(cafe_no) from cafe c left join theme t on c.theme_no = t.theme_no where (c.theme_no in (1, 3)) and t.theme_no = 1;
select count(cafe_no) from cafe c WHERE (c.theme_no in ( '1' , '3' ) ) AND t.theme_no = '3';
select * from `zone`;


-- cafe best
select * from cafe;
select spoint
	from starpoint s left join cafe c on s.cafe_no = c.cafe_no,
		(select cafe_no, round(avg(star_point), 1) as spoint, update_date from starpoint where month(update_date) = month(now())-1 group by cafe_no) spoint
	where s.cafe_no = spoint.cafe_no and c.cafe_cdt = 1
	group by s.cafe_no
	order by spoint desc, spoint.update_date desc limit 10;

select spoint, c.*, i.image_name 
	from starpoint s left join cafe c on s.cafe_no = c.cafe_no left join image i on c.cafe_no = i.cafe_no ,
		(select cafe_no, round(avg(star_point), 1) as spoint, update_date from starpoint where month(update_date) = month(now())-1 group by cafe_no) spoint
	where s.cafe_no = spoint.cafe_no and c.cafe_cdt = 1
	group by s.cafe_no
	order by spoint desc, spoint.update_date desc limit 10;

select cafe_no, round(avg(star_point), 1) as spoint, update_date 
	from starpoint 
	where month(update_date) = month(now())-1 
	group by cafe_no
	order by spoint desc;

select * from starpoint where cafe_no = 24 and month(update_date) = month(now())-1;

select i.image_name from image i left join cafe c on i.cafe_no = c.cafe_no where c.cafe_no = 24 order by i.image_no limit 1;
