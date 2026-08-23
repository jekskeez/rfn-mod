package §_-81S§
{
   public class §_-fb§ extends §_-33w§
   {
      
      private var §_-P20§:Boolean = false;
      
      public function §_-fb§(param1:int, param2:int, param3:int)
      {
         super(param1,param2,param3);
      }
      
      override public function §_-027§() : void
      {
         if(this.§_-P20§)
         {
            return;
         }
         this.§_-P20§ = true;
         super.§_-027§();
         addChild(new PostElementAdmin());
         addChild(new §_-22V§("<body><b>" + gls("Информация") + "</b></body>",85,5,style));
         var _loc1_:§_-22V§ = new §_-22V§("<body>" + gls("Все важные события будут отображены на твоей почте, ты всегда сможешь\nбыть в курсе всех дел. Также, не забывай проверять почту на наличие\nподарков от друзей!") + "</body>",85,20,style);
         addChild(_loc1_);
      }
   }
}

