package views
{
   import §_-e1G§.§_-Hb§;
   import com.api.Player;
   import flash.display.Sprite;
   import game.mainGame.SquirrelCollection;
   import menu.*;
   
   public class §_-B1w§ extends Sprite
   {
      
      private static const §_-NB§:int = 10;
      
      private var §_-M2j§:ImageOnline = new ImageOnline();
      
      private var §_-V15§:ImageOffline = new ImageOffline();
      
      public var time:§_-Hb§;
      
      public function §_-B1w§(param1:int = 10)
      {
         super();
         this.time = new §_-Hb§(this,"");
         this.§_-V15§.visible = false;
         this.§_-V15§.width = this.§_-V15§.height = param1;
         addChild(this.§_-V15§);
         this.§_-M2j§.visible = false;
         this.§_-M2j§.width = param1;
         this.§_-M2j§.height = param1;
         addChild(this.§_-M2j§);
      }
      
      public function §_-031§(param1:Player) : void
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
            this.§_-V15§.visible = !_loc4_;
            this.§_-M2j§.visible = _loc4_;
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
         this.§_-V15§.visible = !param1.online;
         this.§_-M2j§.visible = Boolean(param1.online);
      }
   }
}

