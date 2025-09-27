import google.generativeai as genai
from config import Settings



settings = Settings()



class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("learnlm-2.0-flash-experimental")

    def generate_response(self,query:str,search_results:list[dict]):
        
        context_text="\n\n".join([
            f"Source {i+1} ({result["url"]}):\n{result["content"]}"
            for i,result in enumerate(search_results)
        ])
        
        full_prompt = f"""
        Context from web search :
        {context_text}

        
        Query: {query}

        Please provide a comprehensive,detailed, well-citied accurate response using the above context. Think and reason deeply. Ensure it answer the query the user is asking. Do not use your knowledge untill it is absolutely necessary
        """ 

        response = self.model.generate_content(full_prompt,stream = True)

        for chunk in response:
            yield chunk.text

  