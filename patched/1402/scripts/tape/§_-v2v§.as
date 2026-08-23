package tape
{
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-v2v§ extends §_-QN§
   {
      
      public function §_-v2v§()
      {
         super();
         var _loc1_:InviteTapeButton = new InviteTapeButton();
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-ud§);
         addChild(_loc1_);
      }
      
      private function §_-ud§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
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

