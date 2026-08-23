package chat
{
   import §_-dc§.§_-e2W§;
   import utils.§_-xb§;
   
   public class §_-r1K§ extends §_-dd§
   {
      
      public static const §_-k1a§:int = 0;
      
      private var type:int = 0;
      
      public function §_-r1K§(param1:int = 0)
      {
         super(null,"");
         this.type = param1;
      }
      
      override public function get text() : String
      {
         if(this.type == §_-k1a§)
         {
            return §_-xb§.span(gls("Новость дня: "),"leaderName") + §_-xb§.span(§_-e2W§.§_-Rg§,"message");
         }
         return "-1";
      }
      
      override public function get canAdd() : Boolean
      {
         return true;
      }
   }
}

