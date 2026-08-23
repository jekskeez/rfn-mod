package §_-t1l§
{
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-v2j§;
   import §_-T2y§.§_-w17§;
   import flash.display.DisplayObject;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-72o§;
   import utils.§_-vS§;
   
   public class §_-E10§ extends GameMap
   {
      
      public function §_-E10§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         super.onHollow(param1);
         if(param1.player.id == Game.selfId)
         {
            §_-w17§.onComplete();
         }
      }
      
      override public function add(param1:* = null) : void
      {
         §_-vS§.§_-41D§(param1);
         super.objects.push(param1);
         if(param1 is DisplayObject && param1.parent == null)
         {
            addChild(param1);
         }
         if(param1 is §_-v2j§ && param1.parentStarling == null)
         {
            §_-83v§(param1);
         }
         if(param1 is §_-72o§)
         {
            (param1 as §_-72o§).§_-t2Q§(this);
         }
      }
      
      override protected function §_-z2§(param1:SquirrelEvent) : void
      {
         super.§_-z2§(param1);
         §_-EX§.next();
      }
   }
}

