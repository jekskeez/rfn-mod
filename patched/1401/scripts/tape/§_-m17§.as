package tape
{
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-m17§ extends §_-K2k§
   {
      
      public function §_-m17§()
      {
         super();
         var _loc1_:InviteTapeButton = new InviteTapeButton();
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-3R§);
         addChild(_loc1_);
      }
      
      private function §_-3R§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         Game.inviteFriends();
      }
      
      override public function listen(param1:Function) : void
      {
      }
      
      override public function forget(param1:Function) : void
      {
      }
   }
}

