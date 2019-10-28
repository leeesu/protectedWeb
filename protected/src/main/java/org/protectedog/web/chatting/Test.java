package org.protectedog.web.chatting;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

public class Test {

	public static void main(String[] args) {

		MongoClient mongoClient = null;

		try {
			mongoClient = new MongoClient("localhost", 27017);
			System.out.println("���� ����");

			WriteConcern wc = new WriteConcern(1, 2000);

			mongoClient.setWriteConcern(wc);

			DB db = mongoClient.getDB("chatting");

			DBCollection col = db.getCollection("chattingRoomList");

			// insert
			DBObject doc = new BasicDBObject();
			doc.put("userId", "eunwoo");
			doc.put("chattingTitle", 24);
			col.insert(doc);
			System.out.println("���ԿϷ�");

			System.out.println("\n========================================================\n");

			// getList
			DBCursor cursor = col.find();
			while (cursor.hasNext()) {
				// System.out.println(cursor.next().get("_id")); id�÷��� ���
				System.out.println(cursor.next());
			}

			System.out.println("\n========================================================\n");

			// get
			DBObject o = new BasicDBObject();
			o.put("name", "eunwoo");
			DBCursor cursor2 = col.find(o);
			while (cursor2.hasNext()) {
				System.out.println(cursor2.next().toString());
			}

			System.out.println("\n========================================================\n");

			// update
			DBObject origin = new BasicDBObject("name", "eunwoo");
			DBObject set = new BasicDBObject("$set", new BasicDBObject("name", "ooeunwooo"));
			col.update(origin, set);// ���� ���� �ڿ��� �ٲ�� ������
			System.out.println("������Ʈ�Ϸ�");

			System.out.println("\n========================================================\n");

			// getList
			DBCursor cursor3 = col.find();
			while (cursor3.hasNext()) {
				// System.out.println(cursor.next().get("_id")); id�÷��� ���
				System.out.println(cursor3.next());
			}

			System.out.println("\n========================================================\n");

			col.remove(new BasicDBObject("name", "ooeunwooo"));
			System.out.println("�����Ϸ�");

			System.out.println("\n========================================================\n");

			// getList
			DBCursor cursor4 = col.find();
			while (cursor4.hasNext()) {
				// System.out.println(cursor.next().get("_id")); id�÷��� ���
				System.out.println(cursor4.next());
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
