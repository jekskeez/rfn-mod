package chat
{
   import §_-U19§.§_-B2U§;
   import utils.§_-r1G§;
   
   public class §_-mZ§ extends §_-e28§
   {
      
      public static const §_-W1p§:int = 0;
      
      private var type:int = 0;
      
      public function §_-mZ§(param1:int = 0)
      {
         super(null,"");
         this.type = param1;
      }
      
      override public function get text() : String
      {
         if(this.type == §_-W1p§)
         {
            return §_-r1G§.span(gls("Новость дня: "),"leaderName") + §_-r1G§.span(§_-B2U§.§_-Z2Y§,"message");
         }
         return "-1";
      }
      
      override public function get canAdd() : Boolean
      {
         return true;
      }
   }
}

