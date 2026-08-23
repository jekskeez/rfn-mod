package
{
   import §_-68§.§_-M10§;
   import §_-N14§.§_-i2C§;
   import §_-N14§.§_-w2t§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import dragonBones.§_-E1r§;
   import flash.display.BlendMode;
   import flash.events.Event;
   import flash.media.SoundChannel;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import sounds.GameSounds;
   import utils.§_-Xc§;
   
   public class §_-31F§ extends §_-h2I§ implements §_-Xc§
   {
      
      private static const §_-62z§:String = "acorn";
      
      private static const §_-42Z§:String = "Head";
      
      public static const §_-i29§:String = "stomp";
      
      public static const §_-21y§:String = "laugh";
      
      public static const §_-ON§:String = "chewing";
      
      public static const §_-21q§:String = "spittle";
      
      public static const §_-Z1§:String = "rockRun";
      
      public static const §_-j2t§:String = "rockStand";
      
      public static const §_-Y2M§:Number = 0.3;
      
      private static const §_-n1S§:Array = ["hare_laugh_long","hare_laugh_loop","hare_laugh_short","hare_laugh1","hare_laugh2","hare_laugh3","hare_laugh4"];
      
      private static const §_-W1g§:Array = ["hare_stomp_short0","hare_stomp_short1","hare_stomp_short2","hare_stomp_short3"];
      
      public var armature:§_-E1r§ = null;
      
      private var §_-a1X§:Boolean = false;
      
      private var §_-6N§:Boolean = false;
      
      private var §_-U1j§:Boolean = false;
      
      private var §_-vL§:Boolean = false;
      
      private var §_-eN§:Boolean = false;
      
      private var §_-y11§:Boolean = false;
      
      private var §_-71n§:int = -2;
      
      private var §_-4L§:SoundChannel = null;
      
      private var §_-03Z§:SoundChannel = null;
      
      private var §_-72s§:SoundChannel = null;
      
      private var §_-Q2E§:§_-d2d§ = null;
      
      private var §_-j1j§:§_-h2I§ = new §_-h2I§();
      
      public function §_-31F§()
      {
         super();
         this.§_-q1L§();
         this.setState(Hero.§_-1d§);
      }
      
      public function remove() : void
      {
         if(this.§_-Q2E§)
         {
            this.§_-Q2E§.removeFromParent();
         }
         this.§_-Q2E§ = null;
         §_-w2t§.§_-R2J§.remove(this.armature);
         this.armature.dispose();
         this.armature = null;
         if(this.§_-ws§(this.§_-j1j§))
         {
            removeChildStarling(this.§_-j1j§,false);
         }
         this.§_-j1j§ = null;
      }
      
      public function get state() : int
      {
         return this.§_-71n§;
      }
      
      public function set §_-P2§(param1:Number) : void
      {
         this.armature.animation.timeScale += param1;
      }
      
      public function get §_-P2§() : Number
      {
         return 0;
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-71n§ == param1 && param1 == Hero.§_-1d§)
         {
            return;
         }
         this.§_-71n§ = param1;
         if(this.§_-Q2E§)
         {
            this.§_-Q2E§.stop();
            this.§_-Q2E§.visible = false;
         }
         if(this.state == Hero.§_-w11§)
         {
            this.§_-51j§();
         }
         else
         {
            this.§_-Ur§();
         }
         if(param1 == Hero.§_-1d§)
         {
            return;
         }
         if(this.§_-62l§ && this.§_-71n§ != Hero.§_-Mn§)
         {
            this.§_-F2J§();
            return;
         }
         switch(this.§_-71n§)
         {
            case Hero.§_-Mn§:
               this.§_-E4§();
               this.§_-Q2E§.gotoAndPlay(0);
               this.§_-Q2E§.visible = true;
               this.§_-j1j§.visible = false;
               break;
            default:
               this.laugh = false;
               this.§_-j1j§.visible = true;
               this.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.state]);
         }
      }
      
      public function get §_-62l§() : Boolean
      {
         return this.§_-a1X§;
      }
      
      public function set §_-62l§(param1:Boolean) : void
      {
         this.§_-a1X§ = param1;
         if(this.§_-y11§)
         {
            this.laugh = false;
         }
         this.setState(this.state);
         if(!param1)
         {
            return;
         }
         GameSounds.playUnrepeatable(Math.random() > 0.5 ? "hare_rock_shape" : "hare_rock",§_-Y2M§);
      }
      
      public function get stomp() : Boolean
      {
         return this.§_-6N§;
      }
      
      public function set stomp(param1:Boolean) : void
      {
         this.§_-6N§ = param1;
         if(this.§_-y11§)
         {
            this.laugh = false;
         }
         this.armature.animation.gotoAndPlay(param1 ? §_-i29§ : Hero.§_-01j§);
         if(param1)
         {
            this.§_-M2M§();
         }
         else
         {
            this.§_-m1i§();
         }
      }
      
      public function get §_-18§() : Boolean
      {
         return this.§_-U1j§;
      }
      
      public function set §_-18§(param1:Boolean) : void
      {
         this.§_-U1j§ = param1;
         if(param1)
         {
            this.armature.§_-M1s§(§_-42Z§).childArmature.animation.gotoAndPlay(§_-ON§);
         }
         else
         {
            this.armature.animation.gotoAndPlay(Hero.§_-01j§);
         }
      }
      
      public function set spit(param1:Boolean) : void
      {
         this.§_-vL§ = param1;
         this.armature.animation.gotoAndPlay(param1 ? §_-21q§ : Hero.§_-01j§);
      }
      
      public function get §_-Oj§() : Boolean
      {
         return this.§_-eN§;
      }
      
      public function set §_-Oj§(param1:Boolean) : void
      {
         this.§_-eN§ = param1;
         this.armature.§_-M1s§(§_-62z§).§_-r2q§ = param1 ? §_-62z§ : null;
         if(!param1)
         {
            return;
         }
         this.armature.animation.gotoAndPlay(§_-62z§,-1,-1,NaN,0,§_-62z§,§_-i2C§.§_-511§);
         this.armature.§_-V1S§();
         §_-w2t§.§_-R2J§.§_-ld§(§_-01Y§.delay);
      }
      
      public function set laugh(param1:Boolean) : void
      {
         this.§_-y11§ = param1;
         this.armature.animation.gotoAndPlay(param1 ? §_-21y§ : Hero.§_-01j§);
         if(param1)
         {
            this.§_-12k§();
         }
         else
         {
            this.§_-v1C§();
         }
      }
      
      private function §_-F2J§() : void
      {
         if(this.state == Hero.§_-w11§)
         {
            this.armature.animation.gotoAndPlay(§_-Z1§);
         }
         else
         {
            this.armature.animation.gotoAndPlay(§_-j2t§);
         }
         this.§_-j1j§.visible = true;
      }
      
      private function §_-M2M§(param1:Event = null) : void
      {
         this.§_-m1i§();
         if(!this.parentStarling || !this.parentStarling.visible || !GameSounds.on)
         {
            return;
         }
         this.§_-03Z§ = GameSounds.play(§_-W1g§[int(Math.random() * §_-W1g§.length)]);
         if(this.§_-03Z§ == null)
         {
            setTimeout(this.§_-M2M§,100);
            return;
         }
         this.§_-03Z§.addEventListener(Event.SOUND_COMPLETE,this.§_-M2M§,false,0,true);
      }
      
      private function §_-m1i§() : void
      {
         if(this.§_-03Z§ == null)
         {
            return;
         }
         GameSounds.stop(this.§_-03Z§);
         this.§_-03Z§.removeEventListener(Event.SOUND_COMPLETE,this.§_-M2M§,false);
         this.§_-03Z§ = null;
      }
      
      private function §_-12k§(param1:Event = null) : void
      {
         this.§_-v1C§();
         if(!this.parentStarling || !this.parentStarling.visible || !GameSounds.on)
         {
            return;
         }
         this.§_-72s§ = GameSounds.playUnrepeatable(§_-n1S§[int(Math.random() * §_-n1S§.length)]);
         if(this.§_-72s§ == null)
         {
            setTimeout(this.§_-12k§,1000);
            return;
         }
         this.§_-72s§.addEventListener(Event.SOUND_COMPLETE,this.§_-12k§,false,0,true);
      }
      
      private function §_-v1C§() : void
      {
         if(this.§_-72s§ == null)
         {
            return;
         }
         GameSounds.stop(this.§_-72s§);
         this.§_-72s§.removeEventListener(Event.SOUND_COMPLETE,this.§_-12k§,false);
         this.§_-72s§ = null;
      }
      
      private function §_-51j§(param1:Event = null) : void
      {
         this.§_-Ur§();
         if(!this.parentStarling || !this.parentStarling.visible || !GameSounds.on)
         {
            return;
         }
         if(this.§_-P2§ == 1)
         {
            this.§_-4L§ = GameSounds.play("hare_step");
         }
         else
         {
            this.§_-4L§ = GameSounds.play("hare_run");
         }
         if(this.§_-4L§ == null)
         {
            setTimeout(this.§_-51j§,1000);
            return;
         }
         this.§_-4L§.addEventListener(Event.SOUND_COMPLETE,this.§_-51j§,false,0,true);
      }
      
      private function §_-Ur§() : void
      {
         if(this.§_-4L§ == null)
         {
            return;
         }
         GameSounds.stop(this.§_-4L§);
         this.§_-4L§.removeEventListener(Event.SOUND_COMPLETE,this.§_-51j§,false);
         this.§_-4L§ = null;
      }
      
      private function §_-q1L§() : void
      {
         this.armature = §_-M10§.§_-238§().§_-g1F§(§_-M10§.§_-E2R§);
         §_-w2t§.§_-R2J§.add(this.armature);
         this.§_-j1j§.§_-83v§(this.armature.display);
         §_-83v§(this.§_-j1j§);
      }
      
      private function §_-E4§() : void
      {
         if(this.§_-Q2E§)
         {
            return;
         }
         var _loc1_:Class = getDefinitionByName("HareDead") as Class;
         this.§_-Q2E§ = new §_-d2d§(new _loc1_());
         this.§_-Q2E§.blendMode = BlendMode.SCREEN;
         this.§_-Q2E§.loop = false;
         this.§_-Q2E§.stop();
         §_-83v§(this.§_-Q2E§);
      }
   }
}

