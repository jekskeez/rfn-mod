package §_-t14§
{
   import §_-TK§.§_-51g§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-fx§;
   import flash.display.DisplayObject;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-hQ§;
   import utils.§_-d1t§;
   
   public class §_-C2A§ extends GameMap
   {
      
      public function §_-C2A§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         super.onHollow(param1);
         if(param1.player.id == Game.selfId)
         {
            §_-fx§.onComplete();
         }
      }
      
      override public function add(param1:* = null) : void
      {
         §_-d1t§.§_-B12§(param1);
         super.objects.push(param1);
         if(param1 is DisplayObject && param1.parent == null)
         {
            addChild(param1);
         }
         if(param1 is §_-51g§ && param1.parentStarling == null)
         {
            §_-J2J§(param1);
         }
         if(param1 is §_-hQ§)
         {
            (param1 as §_-hQ§).§_-x26§(this);
         }
      }
      
      override protected function §_-b1X§(param1:SquirrelEvent) : void
      {
         super.§_-b1X§(param1);
         §_-Q2X§.next();
      }
   }
}

