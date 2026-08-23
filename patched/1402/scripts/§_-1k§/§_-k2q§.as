package §_-1k§
{
   public class §_-k2q§ extends §_-G2R§
   {
      
      private var §_-u21§:Boolean = false;
      
      public function §_-k2q§(param1:int, param2:int, param3:int)
      {
         super(param1,param2,param3);
      }
      
      override public function §_-O1s§() : void
      {
         if(this.§_-u21§)
         {
            return;
         }
         this.§_-u21§ = true;
         super.§_-O1s§();
         addChild(new PostElementAdmin());
         addChild(new §_-i5§("<body><b>" + gls("Информация") + "</b></body>",85,5,style));
         var _loc1_:§_-i5§ = new §_-i5§("<body>" + gls("Все важные события будут отображены на твоей почте, ты всегда сможешь\nбыть в курсе всех дел. Также, не забывай проверять почту на наличие\nподарков от друзей!") + "</body>",85,20,style);
         addChild(_loc1_);
      }
   }
}

