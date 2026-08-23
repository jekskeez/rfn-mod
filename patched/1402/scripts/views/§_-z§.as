package views
{
   import §_-S1n§.§_-kr§;
   import com.api.Player;
   import flash.display.Sprite;
   import game.mainGame.SquirrelCollection;
   import menu.*;
   
   public class §_-z§ extends Sprite
   {
      
      private static const §_-o1y§:int = 10;
      
      private var §_-03d§:ImageOnline = new ImageOnline();
      
      private var §_-k1f§:ImageOffline = new ImageOffline();
      
      public var time:§_-kr§;
      
      public function §_-z§(param1:int = 10)
      {
         super();
         this.time = new §_-kr§(this,"");
         this.§_-k1f§.visible = false;
         this.§_-k1f§.width = this.§_-k1f§.height = param1;
         addChild(this.§_-k1f§);
         this.§_-03d§.visible = false;
         this.§_-03d§.width = param1;
         this.§_-03d§.height = param1;
         addChild(this.§_-03d§);
      }
      
      public function §_-yC§(param1:Player) : void
      {
         if(!Game.toggle)
         {
            var _loc4_:Boolean = Boolean(param1.online);
            if(!_loc4_)
            {
               if(SquirrelCollection.instance != null)
               {
                  _loc4_ = SquirrelCollection.instance.get(param1.uid) != null;
               }
            }
            this.§_-k1f§.visible = !_loc4_;
            this.§_-03d§.visible = _loc4_;
            if(_loc4_)
            {
               this.time.setStatus("AwardHollow1");
               return;
            }
            if(int(param1["last_online"]) <= 0)
            {
               this.time.setStatus("Сейчас в игре" + "Был в сети: ");
               return;
            }
            var _loc2_:Date = new Date(Number(param1["last_online"]) * 1000);
            var _loc3_:String = _loc2_.getDate() + "." + (_loc2_.getMonth() + 1) + "." + _loc2_.getFullYear() + " " + _loc2_.toTimeString().slice(0,5);
            this.time.setStatus("Сейчас в игре" + _loc3_);
            return;
         }
         this.§_-k1f§.visible = !param1.online;
         this.§_-03d§.visible = Boolean(param1.online);
      }
   }
}

