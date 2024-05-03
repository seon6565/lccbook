ALTER TABLE lcc_bbs ADD 
CONSTRAINT `FK_lcc_bbs_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_bbs_file add
CONSTRAINT `FK_lcc_bbs_file_lcc_bbs` FOREIGN KEY (`bbs_idx`) REFERENCES `lcc_bbs` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_bbs_reply ADD
CONSTRAINT `FK_lcc_bbs_reply_lcc_bbs` FOREIGN KEY (`bbs_idx`) REFERENCES `lcc_bbs` (`idx`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE lcc_bbs_reply ADD 
CONSTRAINT `FK_lcc_bbs_reply_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_book ADD 
CONSTRAINT `FK_lcc_book_lcc_category` FOREIGN KEY (`category_idx`) REFERENCES `lcc_category` (`category_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_bookreview ADD 
CONSTRAINT `FK_lcc_bookreview_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE lcc_bookreview ADD 
CONSTRAINT `FK_lcc_bookreview_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_cart ADD 
CONSTRAINT `FK_lcc_cart_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE lcc_cart ADD 
CONSTRAINT `FK_lcc_cart_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_delivery ADD 
CONSTRAINT `FK_lcc_delivery_lcc_payment` FOREIGN KEY (`payment_idx`) REFERENCES `lcc_payment` (`payment_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_instock ADD 
CONSTRAINT `FK_lcc_instock_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_outstock ADD 
CONSTRAINT `FK_lcc_outstock_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE lcc_outstock ADD 
CONSTRAINT `FK_lcc_outstock_lcc_delivery` FOREIGN KEY (`delivery_idx`) REFERENCES `lcc_delivery` (`delivery_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lcc_qna ADD 
CONSTRAINT `FK_lcc_qna_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE ADD lcc_qna
CONSTRAINT `FK_lcc_qna_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION