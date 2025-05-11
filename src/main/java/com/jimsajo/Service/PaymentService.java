package com.jimsajo.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jimsajo.Dto.PaymentDto;
import com.jimsajo.Mapper.IPaymentMapper;

@Service
public class PaymentService {

	@Autowired
	private IPaymentMapper iPaymentDao;

	private final String impKey = "7147215444520710";
	private final String impSecret = "T20TfyhxdHXEaXYxb2bfwqBw60fxBA0tgrK20xta87zgTQns9ogBDSgdr3HGqKWONe3Cro83mVOQlnmi";

	public String getAccessToken() throws IOException {
		URL url = new URL("https://api.iamport.kr/users/getToken");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setDoOutput(true);

		Map<String, String> map = Map.of("imp_key", impKey, "imp_secret", impSecret);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map);

		try (OutputStream os = conn.getOutputStream()) {
			os.write(json.getBytes());
		}

		try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
			String response = br.lines().collect(Collectors.joining());
			JsonNode node = mapper.readTree(response);
			return node.path("response").path("access_token").asText();
		}
	}

	public void verifyAndSave(String impUid, int pNum, int mNum) throws IOException {
	    String token = getAccessToken();
	    URL url = new URL("https://api.iamport.kr/payments/" + impUid);
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Authorization", token);

	    try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
	        String response = br.lines().collect(Collectors.joining());
	        ObjectMapper mapper = new ObjectMapper();
	        JsonNode paymentInfo = mapper.readTree(response).path("response");

	        PaymentDto payment = new PaymentDto();
	        payment.setImpUid(paymentInfo.get("imp_uid").asText());
	        payment.setMerchantUid(paymentInfo.get("merchant_uid").asText());
	        payment.setPayMethod(paymentInfo.get("pay_method").asText());
	        payment.setPayAmount(paymentInfo.get("amount").asInt());
	        payment.setPayStatus(paymentInfo.get("status").asText());

	        if (paymentInfo.hasNonNull("paid_at")) {
	            payment.setPaidAt(LocalDateTime.ofInstant(
	                Instant.ofEpochSecond(paymentInfo.get("paid_at").asLong()), ZoneId.systemDefault()));
	        }
	        payment.setPNum(pNum);
	        payment.setMNum(mNum);
	        iPaymentDao.insertPayment(payment);
	    }
	}
}


